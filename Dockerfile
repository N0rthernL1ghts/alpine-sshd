FROM webhippie/alpine:latest

LABEL maintainer="Aleksandar Puharic xzero@elite7haers.net"

ADD rootfs /

WORKDIR /root

ENV REFRESHED_AT 2016-04-10
RUN apk update &&\
    apk upgrade && \
    apk add openssh-sftp-server openssh-client dropbear &&\
    rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear
RUN touch /var/log/lastlog

CMD ["/bin/s6-svscan", "/etc/s6"]
