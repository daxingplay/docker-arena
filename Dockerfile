FROM node:8-alpine

ENV VERSION 2.4.5

COPY start.sh /srv/

RUN set -xe && \
    apk add --no-cache unzip curl && \
    curl -fsSLO --compressed "https://github.com/bee-queue/arena/archive/v$VERSION.zip" && \
    unzip -o "v$VERSION.zip" -d /srv && \
    mv "/srv/arena-$VERSION" /srv/arena && \
    rm -rf "v$VERSION.zip" && \
    apk del unzip curl

VOLUME "/srv/config"

CMD ["/srv/start.sh"]
