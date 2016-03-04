alpine-base
=====================

A base image to run anything. It's based in alpine linux 3.3, adding basic packages bash openssl curl

## Build

```
docker build -t rawmind/alpine-basic:<version> .
```

## Versions

- `0.3.3` [(Dockerfile)](https://github.com/rawmind0/docker-alpine/blob/master/alpine-base/Dockerfile)

## Usage

To use this image include `FROM rawmind/alpine-monit` at the top of your `Dockerfile`.
