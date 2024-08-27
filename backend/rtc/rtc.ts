import { Server } from "socket.io";
import { DefaultEventsMap } from "socket.io/dist/typed-events";


export const rtc = (io: Server<DefaultEventsMap, DefaultEventsMap, DefaultEventsMap, any>) => {
    io.on('connection', ()=>{
        console.log('Socket client connected');
    });
};