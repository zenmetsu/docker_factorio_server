sudo docker run --rm -it \
	-v /home/vagrant/docker_factorio_server/server-settings.json:/opt/factorio/data/server-settings.json \
	-v /data/mods:/opt/factorio/mods \
	-v /data/saves:/opt/factorio/saves \
	--name factorio \
	factorio
