FROM debian:latest

MAINTAINER zopanix <zopanix@gmail.com>

WORKDIR /opt

COPY ./smart_launch.sh /opt

CMD ["./smart_launch.sh"]

EXPOSE 34197/udp

VOLUME "/opt/factorio/saves"

VOLUME "/opt/factorio/mods"

ENV FACTORIO_AUTOSAVE_INTERVAL=2 \
    FACTORIO_AUTOSAVE_SLOTS=3 \
    FACTORIO_DISSALOW_COMMANDS=true \
    FACTORIO_NO_AUTO_PAUSE=false \
    VERSION=0.12.30 \
    FACTORIO_SHA1="77d92ecc52989f3283462fd5c9b5ba07eb6081cc"

RUN echo "# Installing curl" && \
    apt-get update && \
    apt-get install -y curl && \
    echo "# Downloading and unzipping factorio" && \
    curl -L -k https://www.factorio.com/get-download/$VERSION/headless/linux64 -o /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    echo "$FACTORIO_SHA1 /tmp/factorio_headless_x64_$VERSION.tar.gz" | sha1sum -c - && \
    tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    echo "# Cleaning" && \
    apt-get remove -y --purge curl  && \
    apt-get autoremove -y --purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
