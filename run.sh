#mkdir -p /tmp/factorio/config
#mkdir -p /tmp/factorio/mods
#mkdir -p /tmp/factorio/saves
#cp -n server-settings.example.json /tmp/factorio/config/server-settings.json
#cp -n map-gen-settings.example.json /tmp/factorio/config/map-gen-settings.json
sudo docker run --rm -it \
	-v /tmp/factorio:/factorio \
	--name factorio \
	factorio "$@"
