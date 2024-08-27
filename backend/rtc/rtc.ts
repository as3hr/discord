import { Server, Socket } from "socket.io";
import { DefaultEventsMap } from "socket.io/dist/typed-events";
import { createWebRtcTransport } from "./rtc_helpers";

export const rtc = (
    io: Server<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>,
    socket: Socket<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>
) => {

    socket.on('joinRoom', async (data, callback) => {
        const { channelId, userId } = data;
        const transport = await createWebRtcTransport();
        callback({ transportOptions: transport });
        socket.join(channelId);
        io.to(channelId).emit('roomJoined', { userId, channelId });
    });
      
};
