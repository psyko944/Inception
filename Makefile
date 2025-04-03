all:
	docker compose -f ./srcs/docker-compose.yml up -d  --build 

logs:
	docker logs nginx
	docker logs mariadb
	docker logs wordpress

down:
	docker compose -f ./srcs/docker-compose.yml down
	
clean: down
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);

.PHONY: all logs down clean
