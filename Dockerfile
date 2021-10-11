FROM alpine:3.13

ENV MP3_BITRATE 320
ENV MP3_QUALITY 0
ENV IMAGE_DIR /rip

RUN apk add -U \
        libcdio-paranoia \
        lame \
        bash

ADD run.sh /usr/local/bin/nrg2mp3
RUN chmod 775 /usr/local/bin/nrg2mp3

WORKDIR ${IMAGE_DIR}
CMD ["nrg2mp3"]
