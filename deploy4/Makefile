build:
	docker build -t elbowpay:v0.0.4 .

run:
	docker run -d -p 1957:1957 elbowpay:v0.0.4

push:
	docker tag elbowpay:v0.0.4 worldbosskafka/elbowpay:v0.0.4
	docker push worldbosskafka/elbowpay:v0.0.4