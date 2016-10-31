#!/bin/bash -x

set -e

SAVES=/opt/factorio/saves

mkdir -p /factorio/saves
mkdir -p /factorio/mods
mkdir -p /factorio/config

if [ ! -f /factorio/config/rconpw ]; then
  echo $(pwgen 15 1) > /factorio/config/rconpw
fi

if [ ! -f /factorio/config/server-settings.json ]; then
  cp /opt/factorio/data/server-settings.example.json /factorio/config/server-settings.json
fi

if [ ! -f /factorio/config/map-gen-settings.json ]; then
  cp /opt/factorio/data/map-gen-settings.example.json /factorio/config/map-gen-settings.json
fi

if ! find -L $SAVES -iname \*.zip -mindepth 1 -print | grep -q .; then
  /opt/factorio/bin/x64/factorio \
    --create $SAVES/save.zip \
    --map-gen-settings /opt/factorio/data/map-gen-settings.json
fi

exec /opt/factorio/bin/x64/factorio \
  --port 34197 \
  --start-server-load-latest \
  --server-settings /opt/factorio/data/server-settings.json \
  --rcon-port 27015 \
  --rcon-password "$(cat /factorio/config/rconpw)"
