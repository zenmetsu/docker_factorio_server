FROM frolvlad/alpine-glibc:alpine-3.4

MAINTAINER https://github.com/dtandersen/docker_factorio_server

COPY ./factorio.crt /opt/factorio.crt

ENV VERSION=0.14.17 \
    SHA1=ffb248fabed345aafadb6a8cdef3684312ac240f

RUN apk --no-cache add curl tini pwgen && \
    curl -sSL --cacert /opt/factorio.crt \
        https://www.factorio.com/get-download/$VERSION/headless/linux64 \
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
