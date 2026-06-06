#!/bin/bash

docker login

docker build -t elbowpay:v0.0.2 .

docker run elbowpay:v0.0.2

docker tag elbowpay:v0.0.2 worldbosskafka/elbowpay:v0.0.2

docker push worldbosskafka/elbowpay:v0.0.2

# docker pull worldbosskafka/elbowpay:v0.0.2
# docker run worldbosskafka/elbowpay:v0.0.2