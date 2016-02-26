FROM docker.io/alpine:3.3
MAINTAINER Innovation Technologies <InnoTech@bbva.com>

# Install basic packages and cloudframe ca
COPY ca_cloudframe.crt /etc/ssl/certs/ca_cloudframe.pem
RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt 

