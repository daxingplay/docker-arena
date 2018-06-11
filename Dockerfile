FROM node:8-alpine

ENV VERSION 2.4.5

COPY start.sh /srv/

RUN set -xe && \
    apk add --no-cache unzip curl && \
    curl -fsSLO --compressed "https://github.com/bee-queue/arena/archive/v$VERSION.zip" && \
    unzip -o "v$VERSION.zip" -d /srv && \
    mv "/srv/arena-$VERSION" /srv/arena && \
    rm -rf "v$VERSION.zip" && \
    chmod u+x /srv/start.sh && \
    apk del unzip curl
    
RUN cd /srv/arena && \
    npm install --production

VOLUME "/srv/config"

CMD ["/srv/start.sh"]
