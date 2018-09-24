[![](https://images.microbadger.com/badges/image/rawmind/alpine-base.svg)](https://microbadger.com/images/rawmind/alpine-base "Get your own image badge on microbadger.com")

alpine-base
=============

A base image to run anything. It's based in alpine 3.x, adding basic software bash openssl curl fping and libcap.

## Build

```
ci/build.sh
```

## Versions

- `3.7-1` [(Dockerfile)](https://github.com/rawmind0/alpine-base/blob/3.7-1/Dockerfile).
- `3.6-8` [(Dockerfile)](https://github.com/rawmind0/alpine-base/blob/3.6-8/Dockerfile).
- `3.5-1` [(Dockerfile)](https://github.com/rawmind0/alpine-base/blob/3.5-1/Dockerfile).
- `0.3.4-1` [(Dockerfile)](https://github.com/rawmind0/alpine-base/blob/0.3.4-1/Dockerfile).
- `0.3.3` [(Dockerfile)](https://github.com/rawmind0/alpine-base/blob/0.3.3/Dockerfile).

## Usage

To use this image include `FROM rawmind/alpine-base` at the top of your `Dockerfile`.
