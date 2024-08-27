import http from 'http';
import { Server } from "socket.io";
import { rtc } from '../export';
import { createWorker } from './media_soup_config';
import { producers, transports } from '../rtc/rtc_helpers';

export const configureSocketAndRtc = async (server: http.Server<typeof http.IncomingMessage, typeof http.ServerResponse>) => {
    await createWorker();
    const io = new Server(server);
    io.on('connection', (socket) => {
        console.log('Socket client connected');
        rtc(io, socket);
        socket.on('disconnect', () => {
            console.log('Client disconnected');
            producers.forEach((producer, producerId) => {
                if (producer.appData.socketId === socket.id) {
                    producer.close();
                    producers.delete(producerId);
                }
            });
            transports.forEach((transport, transportId) => {
                if (transport.appData.socketId === socket.id) {
                    transport.close();
                    transports.delete(transportId);
                }
            });
        });
    
    });
};