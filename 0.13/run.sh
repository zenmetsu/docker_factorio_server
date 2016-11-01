sudo docker run --rm -it \
	-v /tmp/factorio:/factorio \
	--name factorio \
	dtandersen/factorio:0.13-dev "$@"
find /tmp/factorio -type f
