FROM amd64/alpine:3.15.6
MAINTAINER Yechan Kim <kycfeel@gmail.com>

# Download shadowsocks and dependencies
RUN apk add  --allow-untrusted --update mbedtls openssl wget libressl libressl-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main && \
    apk add  --allow-untrusted --update shadowsocks-libev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# Download the v2ray plugin
RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz && \
    tar -xvf v2ray-plugin-linux-amd64-v1.3.2.tar.gz && \
    mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin

ENTRYPOINT /usr/bin/ss-server -s ${SS_SERVER_ADDR} -p ${SS_SERVER_PORT} -k ${SS_PASSWORD} -m ${SS_METHOD} -t ${SS_TIMEOUT}