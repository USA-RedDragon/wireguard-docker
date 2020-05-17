FROM jessfraz/wireguard

ENV WG_QUICK_URL https://git.zx2c4.com/WireGuard/plain/src/tools/wg-quick/linux.bash

RUN apt-get update && apt-get install -y bash wget openresolv && rm -rf /var/lib/apt/lists/*
RUN wget -O /bin/wg-quick $WG_QUICK_URL \
    && chmod +x /bin/wg-quick

VOLUME ["/etc/wireguard"]
EXPOSE 51820/udp

CMD ["wg-quick", "up", "wg0"]
