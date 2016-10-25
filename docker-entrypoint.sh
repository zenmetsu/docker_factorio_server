#!/bin/bash -x

SAVES=/opt/factorio/saves

if [ ! -f $SAVES/*.zip ]
then
  /opt/factorio/bin/x64/factorio --create $SAVES/save.zip
fi

exec /opt/factorio/bin/x64/factorio --start-server-load-latest
