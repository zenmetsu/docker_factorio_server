FROM frolvlad/alpine-glibc:alpine-3.6

MAINTAINER https://github.com/zenmetsu/docker_factorio_server

ENV PORT=34197 \
    VERSION=0.15.34 \
    SHA1=7bc20a702710672ff4a570948ffc06b6f7d4666c

RUN mkdir /opt && \
    apk add --update --no-cache bash htop tini pwgen && \
    apk add --update --no-cache --virtual .build-deps curl && \
    curl -sSL https://www.factorio.com/get-download/$VERSION/headless/linux64 \
        -o /tmp/factorio_headless_x64_$VERSION.tar.xz && \
    tar xf /tmp/factorio_headless_x64_$VERSION.tar.xz --directory /opt && \
    rm /tmp/factorio_headless_x64_$VERSION.tar.xz && \
    ln -s /factorio/saves /opt/factorio/saves && \
    ln -s /factorio/mods /opt/factorio/mods && \
    apk del .build-deps

VOLUME /factorio

EXPOSE $PORT/udp 27015/tcp

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/docker-entrypoint.sh"]
