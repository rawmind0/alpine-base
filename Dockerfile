FROM docker.io/alpine:3.8
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install selfsigned ca (optional)
# COPY <ca.crt> /etc/ssl/certs/<ca.pem>
# Install basic packages 
RUN apk upgrade --update &&     apk add bash libressl curl fping libcap &&     rm -rf /var/cache/apk/* &&     mkdir /opt 
