

all: consul registrator

consul:
	docker run \
	-d \
	--name=consul \
	-p 8400:8400 \
	-p 8500:8500 \
	-p 8600:53/udp \
	-h local-dev-node progrium/consul \
	-server \
	-advertise 192.168.65.1 \
	-bootstrap \
	-ui-dir /ui

registrator:
	docker run \
	-d \
    --name=registrator \
    --volume=/var/run/docker.sock:/tmp/docker.sock \
    gliderlabs/registrator:latest \
    -ip 192.168.65.1 \
    consul://192.168.65.1:8500

