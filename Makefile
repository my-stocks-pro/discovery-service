export MIGRATE='1'
export PGHOST='postgres'
export PGPORT='5432'
export PGNAME='music_room'
export PGUSER='alex'
export PGPASS='12345'
export RDSHOST='redis'
export RDSPORT='6379'
export RDSNAME='1'

all: build

terrup:
	@echo Terraform UP
	terraform init
	terraform apply -var 'access_key=AKEY' -var 'secret_key=SKEY'

terrdown:
	@echo Terraform DOWN
	terraform down

ansible:
	@echo Ansible UP

build:
	eval $(aws ecr --profile alex get-login --no-include-email --region us-east-1 | sed 's|https://||')
	docker-compose up
	docker-compose logs -f

clean:
	docker-compose stop
	docker-compose rm -f
	docker rm $$(docker ps -a -f status=exited -q)
	docker rmi $$(docker images -a -q)
