# Shadowsocks Server
A secure socks5 proxy, designed to protect your Internet traffic, with built-in [v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin). - forked from [dockage/shadowsocks-server](https://github.com/dockage/shadowsocks-server). 


# Installation

Pull the image from the docker index. This is the recommended method of installation as it is easier to update image. These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull kycfeel/shadowsocks-server:latest
```

You can also pull the `latest` tag which is built from the repository *HEAD*

```bash
docker pull kycfeel/shadowsocks-server:latest
```

Alternately you can build the image locally.

```bash
git clone https://github.com/kycfeel/shadowsocks-server.git
cd shadowsocks-server
docker build --tag="$USER/shadowsocks-server" .
```


# How to start

1. Go to the `shadowsocks-certs` folder and generate your custom certificate.

You could skip this step when you already have an SSL certificate.

2. (If you are using a custom certificate) Enable a Cloudflare CDN proxy.

This is required to pass through the certificate validity check since we are going to use the custom cert.

You could skip this step when you already have an SSL certificate.

3. Bring up the server

`docker-compose up -d`

4. Volla.