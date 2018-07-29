# discovery-service
Consul

# Consul container
# 192.168.65.1 is the magic exposed IP
# that communicates back to the host / native
# https://github.com/moby/moby/issues/22753#issuecomment-282725489
# - UI can be accessed via http://127.0.0.1:8500/ui (not localhost)
# The consul agent (aka client / node) name is "local-dev-node"

# to stop the daemon, use "docker kill consul && docker rm consul"

docker run -d --name=consul \
	-p 8400:8400 \
	-p 8500:8500 \
	-p 8600:53/udp \
	-h local-dev-node progrium/consul \
	-server \
	-advertise 192.168.65.1 \
	-bootstrap \
	-ui-dir /ui

# After this runs, you should see the node in the consul ui
docker run -d \
    --name=registrator \
    --volume=/var/run/docker.sock:/tmp/docker.sock \
    gliderlabs/registrator:latest \
      -ip 192.168.65.1 \
      consul://192.168.65.1:8500
