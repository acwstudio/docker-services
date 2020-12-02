runAll: runReverse runMailHog runMySQL8 runMySQL57
runServices: runMailHog runMySQL8 runMySQL57

runMySQL8:
	docker network create mysql8 || true
	cd ~/projects/docker-services/mysql8-service && \
	docker-compose --env-file ~/projects/docker-services/.env up -d

runMySQL57:
	docker network create mysql57 || true
	cd ~/projects/docker-services/mysql57-service && \
	docker-compose --env-file ~/projects/docker-services/.env up -d

runMailHog:
	docker network create mailer || true
	cd ~/projects/docker-services/mailhog-service/ && \
    docker-compose --env-file ~/projects/docker-services/.env up -d

runReverse:
	docker network create proxy || true
	cd ~/projects/docker-services/reverse-proxy/ && \
	~/projects/docker-services/reverse-proxy/init-mkcert.sh