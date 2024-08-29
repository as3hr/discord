import { configDotenv } from 'dotenv';
import express from 'express';
import cors from "cors";
import { queryParser } from "express-query-parser";
import http from 'http';
import { 
    authRouter, 
    channelRouter, 
    configureDatabase, 
    serverRouter, 
} from './export';
import { configureSocketAndRtc } from './config/socket';

configDotenv({path : '.env'});

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

app.use('/auth', authRouter);
app.use('/channels', channelRouter);
app.use('/servers', serverRouter);

configureDatabase();

httpServer.listen(process.env.PORT, () => {
    console.log(`Server is running on port: ${process.env.PORT}`);
});

configureSocketAndRtc(httpServer);