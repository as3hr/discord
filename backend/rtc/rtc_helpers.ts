import { AppData, WebRtcTransport } from "mediasoup/node/lib/types";
import { router } from "../config/media_soup_config";

export const transports = new Map();
export const producers = new Map(); 

export const createWebRtcTransport = async () => {
    const transport: WebRtcTransport<AppData> = await router.createWebRtcTransport({
      listenIps: [{ ip: '0.0.0.0', announcedIp: 'YOUR_SERVER_IP' }],
      enableUdp: true,
      enableTcp: true,
      preferUdp: true,
    });

    transport.on('dtlsstatechange', dtlsState => {
        if (dtlsState === 'closed') {
            transport.close();
        }
    });

    transport.on('@close', () => {
        console.log('Transport closed!');
    });

    transports.set(transport.id, transport);

    return {
        id: transport.id,
        iceParameters: transport.iceParameters,
        iceCandidates: transport.iceCandidates,
        dtlsParameters: transport.dtlsParameters,
    };
};