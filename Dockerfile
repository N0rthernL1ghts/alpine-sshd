FROM nlss/s6-alpine:latest as base

LABEL maintainer="Aleksandar Puharic xzero@elite7haers.net"

# s6-overlay configuration
ENV S6_KEEP_ENV=1
ENV S6_KILL_GRACETIME=6000
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=1

# Env
ENV REFRESHED_AT=2019-11-04

WORKDIR /tmp

RUN apk --update --upgrade --no-cache add \
        openssh-sftp-server \
        openssh-client \
        dropbear \
   && touch /var/log/lastlog

VOLUME ["/home/dropbear"]

ADD rootfs /