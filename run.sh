mkdir -p /tmp/factorio
mkdir -p /tmp/factorio/mods
mkdir -p /tmp/factorio/saves
cp -n server-settings.example.json /tmp/factorio/server-settings.json
cp -n map-gen-settings.example.json /tmp/factorio/map-gen-settings.json
sudo docker run --rm -it \
	-v /tmp/factorio/server-settings.json:/opt/factorio/data/server-settings.json \
	-v /tmp/factorio/map-gen-settings.json:/opt/factorio/data/map-gen-settings.json \
	-v /tmp/factorio/mods:/opt/factorio/mods \
	-v /tmp/factorio/saves:/opt/factorio/saves \
	--name factorio \
	factorio "$@"
