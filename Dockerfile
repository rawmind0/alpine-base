FROM docker.io/alpine:3.3
MAINTAINER Innovation Technologies <InnoTech@bbva.com>

# Install basic packages and cloudframe ca
COPY ca_cloudframe.crt /etc/ssl/certs/ca_cloudframe.pem
RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt && \
    cd /etc/ssl/certs/ && \
    cat ca_cloudframe.pem >> ca-certificates.crt && \
    ln -s ca_cloudframe.pem `openssl x509 -hash -noout -in ca_cloudframe.pem`.0

