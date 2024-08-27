import { router } from "../config/media_soup_config";

export const createWebRtcTransport = async () => {
    const transport = await router.createWebRtcTransport({
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
      console.log('Transport closed');
    });

    return transport;
};