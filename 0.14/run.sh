sudo docker run --rm -it \
	-v /tmp/factorio:/factorio \
	--name factorio \
	factorio "$@"
