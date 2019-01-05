up:
	docker-compose up -d --build

down:
	docker-compose down

restart: down up

exec:
	docker-compose exec app /bin/sh
