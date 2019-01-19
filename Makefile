up:
	docker-compose up -d --build

down:
	docker-compose down

restart: down up

exec:
	docker-compose exec app /bin/sh

push:
	docker build -t site-beta-container:latest .
	docker tag site-beta-container:latest gcr.io/nobv-io/site-beta-container
	gcloud docker -- push gcr.io/nobv-io/site-beta-container

deploy:
	kubectl set image -f k8s/deployment.yaml site=gcr.io/nobv-io/site-beta-container:latest

apply.d:
	kubectl apply -f k8s/deployment.yaml

apply.s:
	kubectl apply -f k8s/service.yaml

apply.i:
	kubectl apply -f k8s/ingress.yaml

apply.all: apply.d apply.s apply.i

delete.d:
	kubectl delete -f k8s/deployment.yaml

delete.s:
	kubectl delete -f k8s/service.yaml

delete.i:
	kubectl delete -f k8s/ingress.yaml

delete.all: delete.d delete.s delete.i
