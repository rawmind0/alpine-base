FROM docker.io/alpine:3.3
MAINTAINER Innovation Technologies <InnoTech@bbva.com>

# Compile and install monit and confd
ENV MONIT_VERSION=5.16 \
    MONIT_HOME=/opt/monit
ENV PATH $PATH:${MONIT_HOME}/bin

# Install basic packages
RUN apk add --update bash openssl curl && mkdir /opt \
  && apk add gcc musl-dev make openssl-dev \
  && mkdir -p /opt/src; cd /opt/src \
  && mkdir -p ${MONIT_HOME}/etc/conf.d ${MONIT_HOME}/log \
  && curl -sS https://mmonit.com/monit/dist/monit-${MONIT_VERSION}.tar.gz | gunzip -c - | tar -xf - \
  && cd /opt/src/monit-${MONIT_VERSION} \
  && ./configure  --prefix=${MONIT_HOME} --without-pam \
  && make && make install \
  && apk del gcc musl-dev make openssl-dev \
  && rm -rf /var/cache/apk/* /opt/src 

# Install cloudframe ca
COPY ca_cloudframe.crt /etc/ssl/certs/ca_cloudframe.pem
RUN cat /etc/ssl/certs/ca_cloudframe.pem >> /etc/ssl/certs/ca-certificates.crt && \
    cd /etc/ssl/certs/ && \
    ln -s ca_cloudframe.pem `openssl x509 -hash -noout -in ca_cloudframe.pem`.0
