import { configDotenv } from 'dotenv';
import express from 'express';
import { Server } from "socket.io";
import cors from "cors";
import { queryParser } from "express-query-parser";
import http from 'http';
import * as mediasoup from 'mediasoup';
import { 
    authRouter, 
    channelRouter, 
    configureDatabase, 
    serverRouter, 
    rtc 
} from './export';

configDotenv({path : '.env'});
let worker: mediasoup.types.Worker;
let router: mediasoup.types.Router;

const app = express();
app.use(cors({ origin: true, credentials: true }));
app.use(express.json());
app.enable("trust proxy");
app.use(
  queryParser({
    parseNull: true,
    parseUndefined: true,
    parseBoolean: true,
    parseNumber: true,
  })
);

const httpServer = http.createServer(app);

const initMediaSoup = async () => {
    worker = await mediasoup.createWorker({
        rtcMinPort: 10000,
        rtcMaxPort: 10100
    });
    worker.on('died', ()=>{
        console.error('Mediasoup Worker died, exiting...');
        process.exit(1);
    });

    router = await worker.createRouter({
        mediaCodecs: [
            {
                kind: 'audio',
                mimeType: 'audio/opus',
                clockRate: 48000,
                channels: 2,
            },
            {
                kind: 'video',
                mimeType: 'video/VP8',
                clockRate: 90000,
            },
        ]});
};

initMediaSoup().then((val) => {});

const io = new Server(httpServer);
rtc(io);

app.use('/auth', authRouter);
app.use('/channels', channelRouter);
app.use('/servers', serverRouter);

configureDatabase();

httpServer.listen(5000, ()=>{
    console.log("Server is running on port 5000");
});