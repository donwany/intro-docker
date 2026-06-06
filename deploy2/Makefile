build:
	docker build -t fastapi-dev .

pull:
	docker pull worldbosskafka/fastapi-dev:latest

run:
	docker run -d --name fastapi-dev -p 8000:8000  worldbosskafka/fastapi-dev

push:
	docker tag fastapi-dev:latest worldbosskafka/fastapi-dev:latest
	docker push worldbosskafka/fastapi-dev:latest


# docker run -p 8000:8000 fastapi-dev
# docker run -d --name fastapi-dev -p 8000:8000 -v $(pwd)/mylogs:/app/logs fastapi-dev