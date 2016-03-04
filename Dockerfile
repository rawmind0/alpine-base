FROM docker.io/alpine:3.3
MAINTAINER Innovation Technologies <InnoTech@bbva.com>

# Install selfsigned ca (optional)
# COPY <ca.crt> /etc/ssl/certs/<ca.pem>
# Install basic packages and cloudframe ca
RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt 

