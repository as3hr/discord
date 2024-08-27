import * as mediasoup from 'mediasoup';

let worker: mediasoup.types.Worker;
let router: mediasoup.types.Router;

const createWorker = async () => {
    worker = await mediasoup.createWorker({
        logLevel: 'warn',
        rtcMinPort: 10000,
        rtcMaxPort: 10100
    });
    worker.on('died', ()=>{
        console.error('Mediasoup Worker died, exiting...');
        process.exit(1);
    });

    router = await worker.createRouter({ mediaCodecs: 
        [{
            kind: 'audio',
            mimeType: 'audio/opus',
            clockRate: 48000,
            channels: 2
        },
        {
            kind: 'video',
            mimeType: 'video/VP8',
            clockRate: 90000
        },] 
    });
};

export { createWorker, worker, router };