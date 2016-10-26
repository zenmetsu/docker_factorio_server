#!/bin/bash -x

SAVES=/opt/factorio/saves

if ! find $SAVES -iname \*.zip -mindepth 1 -print | grep -q .; then
#if [ -z $(find $SAVES -iname \*.zip -mindepth 1 -print | grep -q .) ]; then
  /opt/factorio/bin/x64/factorio \
    --create $SAVES/save.zip \
    --map-gen-settings /opt/factorio/data/map-gen-settings.json
fi

exec /opt/factorio/bin/x64/factorio \
  --port 34197 \
  --start-server-load-latest \
  --server-settings /opt/factorio/data/server-settings.json
