#!/bin/bash -x

SAVES=/opt/factorio/saves

if [ -f $SAVES/*.zip ]
then
  last_save=$(ls $SAVES -lt | grep save |head -1 |awk '{print $(NF)}')
else
  last_save="save.zip"
  /opt/factorio/bin/x64/factorio --create $SAVES/$last_save
fi

exec /opt/factorio/bin/x64/factorio \
  --start-server \
  $SAVES/$last_save
