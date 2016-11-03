FROM frolvlad/alpine-glibc:alpine-3.4

MAINTAINER https://github.com/dtandersen/docker_factorio_server

ENV VERSION=0.14.18 \
    SHA1=8b919fe1c271ca773754f7644b72a8ddec363ae4

RUN mkdir /opt && \
    apk --no-cache add curl tini pwgen && \
    curl -sSL https://www.factorio.com/get-download/$VERSION/headless/linux64 \
        -o /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    echo "$SHA1  /tmp/factorio_headless_x64_$VERSION.tar.gz" | sha1sum -c && \
    tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz --directory /opt && \
    rm /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    apk del curl && \
    ln -s /factorio/saves /opt/factorio/saves && \
    ln -s /factorio/mods /opt/factorio/mods

VOLUME /factorio

EXPOSE 34197/udp 27015/tcp

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/docker-entrypoint.sh"]
