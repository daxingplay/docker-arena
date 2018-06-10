FROM node:8-apline

ENV VERSION 2.4.5

COPY docker /srv/

RUN set -xe && \
    apk add --no-cache unzip wget ca-certificate && \
    wget -N "https://github.com/bee-queue/arena/archive/v$VERSION.zip" && \
    unzip -o "v$VERSION.zip" -d /srv/ && \ 
    rm -rf "v$VERSION.zip" && \
    apk del unzip wget

VOLUME "/srv/config"

CMD ["/srv/start.sh"]