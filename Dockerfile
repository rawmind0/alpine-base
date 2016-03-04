FROM docker.io/alpine:3.3
<<<<<<< HEAD
MAINTAINER Innovation Technologies <InnoTech@bbva.com>

# Install selfsigned ca (optional)
# COPY <ca.crt> /etc/ssl/certs/<ca.pem>
# Install basic packages and cloudframe ca
RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt 
=======
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install basic packages
RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt

# Install selfsigned ca (optional)
#COPY <ca.crt> /etc/ssl/certs/<ca.pem>
#RUN cat /etc/ssl/certs/<ca.pem> >> /etc/ssl/certs/ca-certificates.crt && \
   #cd /etc/ssl/certs/ && \
   #ln -s <ca.pem> `openssl x509 -hash -noout -in <ca.pem>`.0
>>>>>>> e94e7d32ba20e50d003ec1629629850afc683250

