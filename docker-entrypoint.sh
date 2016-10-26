#!/bin/bash -x

SAVES=/opt/factorio/saves

if [ ! -f $SAVES/*.zip ]
then
  /opt/factorio/bin/x64/factorio \
    --create $SAVES/save.zip \
    --map-gen-settings /opt/factorio/data/map-gen-settings.json
fi

exec /opt/factorio/bin/x64/factorio \
  --start-server-load-latest \
  --server-settings /opt/factorio/data/server-settings.json
