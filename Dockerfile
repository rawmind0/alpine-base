FROM docker.io/alpine:3.5
MAINTAINER Raul Sanchez <rawmind@gmail.com>

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="./Dockerfile" \
      org.label-schema.license="e.g. MIT" \
      org.label-schema.name="alpine-base" \
      org.label-schema.description="Alpine base image" \
      org.label-schema.usage="$VCS_URL/blob/$VERSION/README.md" \
      org.label-schema.url="$VCS_URL" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="$VCS_URL" \
      org.label-schema.vendor = "Rawmind" \
      org.label-schema.version = "$VERSION" \
      org.label-schema.schema-version = "1.0"

# Install selfsigned ca (optional)
# COPY <ca.crt> /etc/ssl/certs/<ca.pem>
# Install basic packages 
RUN apk add --update bash openssl curl fping libcap && rm -rf /var/cache/apk/* && mkdir /opt 
