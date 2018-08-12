

all: env create

env:
	export MIGRATE='1'
	export PGHOST='postgres'
	export PGPORT='5432'
	export PGNAME='music_room'
	export PGUSER='alex'
	export PGPASS='12345'
	export RDSHOST='redis'
	export RDSPORT='6379'
	export RDSNAME='1'

create:
	docker-compose up --build
	docker-compose logs

delete:
	docker-compose stop
    docker-compose rm -f
    docker rm $(docker ps -a -f status=exited -q)
    docker rmi $(docker images -a -q)



#all: consul registrator
#
#consul:
#	docker run \
#	-d \
#	--name=consul \
#	-p 8400:8400 \
#	-p 8500:8500 \
#	-p 8600:53/udp \
#	-h local-dev-node progrium/consul \
#	-server \
#	-advertise 192.168.65.1 \
#	-bootstrap \
#	-ui-dir /ui
#
#registrator:
#	docker run \
#	-d \
#    --name=registrator \
#    --volume=/var/run/docker.sock:/tmp/docker.sock \
#    gliderlabs/registrator:latest \
#    -ip 192.168.65.1 \
#    consul://192.168.65.1:8500

