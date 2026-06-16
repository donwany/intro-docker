## Student Deliverables
 - Create FastAPI API.
 - Create pyproject.toml.
 - Build Docker image.
 - Run container locally.
 - Push image to Docker Hub.
 - Deploy on Render.
 - Create Kubernetes Deployment.
 - Create Kubernetes Service.
 - Deploy to Kubernetes.
 - Demonstrate access via browser and /docs

## Project Structure
```
fastapi-demo/
├── app.py
├── pyproject.toml
├── Dockerfile
├── .dockerignore
├── compose.yaml
└── k8s/
    ├── deployment.yaml
    └── service.yaml

```

## Using Dockerfile
```bash
docker build -t fastapi-demo .

docker run -p 8000:8000 fastapi-demo

docker tag fastapi-demo worldbosskafka/fastapi-demo:v1

docker push worldbosskafka/fastapi-demo:v1

http://localhost:8000
```

## With Docker Compose
```bash

docker compose up -d

docker compose down

```

## Deploy to K8s
```bash
# switch between clusters
kubectl config current-context
kubectl config get-contexts
kubectl config use-context minikube
kubectl config use-context docker-desktop

# switch namespaces for current context
kubectl get namespaces
kubectl create namespace dev
kubectl config set-context --current --namespace=dev

# or use kubens
# https://webinstall.dev/kubens/

kubectl run elbowpay-pod --image=worldbosskafka/elbowpay:v0.0.3 --port=8000
kubectl get pods

kubectl describe pod elbowpay-pod

kubectl logs elbowpay-pod
kubectl logs -f elbowpay-pod

# access the pod by doing port-forwarding
kubectl port-forward pod/elbowpay-pod 8000:8000

# http://localhost:8000/docs
# http://localhost:8000
```

## Creating Deployment and Service
- preferred to pods
```bash

kubectl create deployment elbowpay-pod --image=worldbosskafka/elbowpay:v0.0.3

kubectl scale deployment elbowpay-pod --replicas=3

kubectl get deployments
kubectl get pods

# expose as a service
# Type: LoadBalancer, NodePort, ClusterIP
kubectl expose deployment elbowpay-pod --type=LoadBalancer --port=8000 --target-port=8000

kubectl get svc

# for minikube or docker desktop
kubectl expose deployment elbowpay-pod --type=NodePort --port=80 --target-port=8000

# minikube command to access the service
minikube service elbowpay-pod --url
minikube service elbowpay-pod


# one-liner
kubectl run elbowpay-pod --image=worldbosskafka/elbowpay:v0.0.3 --port=8000 && \
kubectl port-forward pod/elbowpay-pod 8000:8000


```

## Generate Deployment and Service
```bash
kubectl create deployment elbowpay-pod \
  --image=worldbosskafka/elbowpay:v0.0.3 \
  --dry-run=client -o yaml > deployment.yaml


kubectl expose deployment elbowpay-pod \
  --type=NodePort \
  --port=80 \
  --target-port=8000 \
  --dry-run=client -o yaml > service.yaml



kubectl get deployment elbowpay-pod -o yaml > deployment.yaml
kubectl get service elbowpay-pod -o yaml > service.yaml


# run yaml files
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f .

kubectl delete -f .

# update an image
kubectl set image deployment/elbowpay-pod elbowpay=worldbosskafka/elbowpay:v0.0.4

kubectl rollout history deployment/elbowpay-pod

kubectl rollout undo deployment/elbowpay-pod
```


```
Kubernetes Cluster
│
├── default namespace
│     ├── fastapi-pod
│     └── service-a
│
├── dev namespace
│     ├── api-pod
│
├── prod namespace
│     ├── payment-service

```