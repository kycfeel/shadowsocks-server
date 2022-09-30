# How to issue a custom certificate

1. Go into the `shadowsocks-cert` directory.

2. Run commands below. (Modify the `mydomain.com` part)

```
openssl genrsa -aes256 -out rootca.key 2048
openssl req -new -key rootca.key -out rootca.csr
openssl x509 -req -days 9999 -set_serial 1 -in rootca.csr -signkey rootca.key -out rootca.crt
openssl genrsa -aes256 -out mydomain.com.key 2048
openssl rsa -in mydomain.com.key -out mydomain.com.np.key
openssl req -new -key mydomain.com.np.key -out mydomain.com.csr
openssl x509 -req -days 9999 -extensions v3_user -in mydomain.com.csr -CA rootca.crt  -CAcreateserial -CAkey rootca.key -out mydomain.com.crt
```

3. Modify the `shadowsocks-conf/config.json` based on your custom domain name.

4. Volla.