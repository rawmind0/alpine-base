FROM docker.io/alpine:3.3
MAINTAINER Innovation Technologies <InnoTech@bbva.com>

# Install basic packages and cloudframe ca
COPY ca_cloudframe.crt /etc/ssl/certs/ca_cloudframe.pem
RUN apk add --update bash openssl curl && mkdir /opt && \
    cat /etc/ssl/certs/ca_cloudframe.pem >> /etc/ssl/certs/ca-certificates.crt && \
    cd /etc/ssl/certs/ && \
    ln -s ca_cloudframe.pem `openssl x509 -hash -noout -in ca_cloudframe.pem`.0

