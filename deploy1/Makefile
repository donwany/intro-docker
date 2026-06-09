build:
	docker build -t elbowpay:v0.0.2 .

run:
	docker run elbowpay:v0.0.2

push:
	docker login
	docker tag elbowpay:v0.0.2 worldbosskafka/elbowpay:v0.0.2
	docker push worldbosskafka/elbowpay:v0.0.2

running:
	docker pull worldbosskafka/elbowpay:v0.0.2
	docker run worldbosskafka/elbowpay:v0.0.2


