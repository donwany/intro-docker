build:
	docker build -t elbowpay-dev:v0.0.1 .

run:
	docker run -d -p 5001:5001 elbowpay-dev:v0.0.1

push:
	docker tag elbowpay-dev:v0.0.1 worldbosskafka/elbowpay-dev:v0.0.1
	docker push worldbosskafka/elbowpay-dev:v0.0.1

pull:
	docker pull worldbosskafka/elbowpay-dev:v0.0.1

# docker run -p 5000:5000 elbowpay-dev
# docker run -d --name elbowpay-dev -p 5000:5000 -v $(pwd)/mylogs:/app/logs elbowpay-dev