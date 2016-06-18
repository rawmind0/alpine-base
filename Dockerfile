FROM docker.io/alpine:3.4
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install selfsigned ca (optional)
# COPY <ca.crt> /etc/ssl/certs/<ca.pem>
# Install basic packages 
RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt 
