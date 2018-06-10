FROM node:8-alpine

ENV VERSION 2.4.5

COPY start.sh /srv/

RUN set -xe && \
    apk add --no-cache unzip curl && \
    curl -fsSLO --compressed "https://github.com/bee-queue/arena/archive/v$VERSION.zip" && \
    unzip -o "v$VERSION.zip" -d ./ && \
    cp -R "arena-$VERSION/*" /srv/ && \
    rm -rf "v$VERSION.zip" && \
    rm -rf "arena-$VERSION" && \
    apk del unzip curl

VOLUME "/srv/config"

CMD ["/srv/start.sh"]
