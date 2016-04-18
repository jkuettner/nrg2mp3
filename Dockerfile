FROM debian:latest

ENV TERM xterm
ENV MP3_BITRATE 320
ENV MP3_QUALITY 0
ENV IMAGE_DIR /rip

RUN apt-get update \
    && apt-get install -y \
        libcdio-utils \
        lame

ADD run.sh /usr/local/bin/nrgripper
RUN chmod 775 /usr/local/bin/nrgripper

WORKDIR ${IMAGE_DIR}
CMD ["nrgripper"]
