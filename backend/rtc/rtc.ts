import { Server, Socket } from "socket.io";
import { DefaultEventsMap } from "socket.io/dist/typed-events";
import { createWebRtcTransport, producers, transports } from "./rtc_helpers";
import { router } from "../config/media_soup_config";

export const rtc = (
    io: Server<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>,
    socket: Socket<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>
) => {
    
    //Group Calling
    socket.on('joinRoom', async (data, callback) => {
        const { channelId, userId } = data;
        const transport = await createWebRtcTransport();
        callback({ transportOptions: transport });
        socket.join(channelId);
        io.to(channelId).emit('roomJoined', { userId, channelId });
    });

    socket.on('produce', async (data, callback) => {
        const { kind, rtpParameters, transportId, channelId } = data;
        const transport = transports.get(transportId);
        
        const producer = await transport.produce({
            kind,
            rtpParameters,
        });

        producers.set(producer.id, producer);

        callback({ id: producer.id });

        socket.to(channelId).emit('newProducer', { producerId: producer.id, kind });
    });

    socket.on('consume', async (data, callback) => {
        const { rtpCapabilities, producerId, transportId, channelId } = data;
        const transport = transports.get(transportId);
        const producer = producers.get(producerId);

        if (!router.canConsume({ producerId: producer.id, rtpCapabilities })) {
            console.error('Client cannot consume');
            return;
        }

        const consumer = await transport.consume({
            producerId: producer.id,
            rtpCapabilities,
        });

        callback({
            id: consumer.id,
            producerId: producer.id,
            kind: consumer.kind,
            rtpParameters: consumer.rtpParameters,
        });

        consumer.on('close', () => {
            console.log('Consumer closed');
        });
    });

    socket.on('sendMessage', (data) => {
        const { channelId, message, userId } = data;
        io.to(channelId).emit('receiveMessage', { userId, message });
    });
      

    //One to One
    socket.on('sendIndividualMessage', (data) => {
        const { chatId, message, userId } = data;
        io.to(chatId).emit('receiveIndividualMessage', { userId, message });
    });

};
