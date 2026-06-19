## Student Lab
- Create an EKS cluster with 2 nodes.
- Connect using kubectl.
- Deploy elbowpay fastapi to EKS.
- Expose elbowpay using a LoadBalancer.
- Scale from 2 replicas to 5 replicas.
- View logs and pod details.
- Delete all resources and the cluster.

# Docker → Docker Hub → Kubernetes → Amazon EKS.

```bash
# install = https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
aws --version

aws configure

# verify
aws sts get-caller-identity

kubectl version --client

# -------------------------------------
# install eksctl: https://eksctl.io/
# -------------------------------------
# Using Chocolatey
choco install eksctl
choco install kubens kubectx
# Using Scoop
scoop install eksctl
scoop install main/kubens main/kubectx
# macos
brew tap aws/tap
brew install aws/tap/eksctl
brew install kubectx
# --------------------------------

eksctl version

# create a cluster
eksctl create cluster --name demo-cluster --region us-east-1 --nodes 2

aws eks list-clusters --region us-east-1

kubectl get nodes

# create namespace
kubectl create ns prod
kubens prod


kubectl config use-context minikube
kubectx minikube

kubectl create deployment elbowpay --image=worldbosskafka/elbowpay:v0.0.4 --port=1957

kubectl scale deployment elbowpay --replicas=2
kubectl scale deployment elbowpay --replicas=5

kubectl expose deployment elbowpay --type=LoadBalancer --port=1957  --target-port=1957

ab993246ddfa948bcaead520513241c6-2061880808.us-east-1.elb.amazonaws.com:1957/docs

# get components
kubectl get nodes
kubectl get ns
kubectl get deployment
kubectl get pods
kubectl get svc

# create yaml files for deployment and service
kubectl get deployment elbowpay -o yaml > deploy.yaml
kubectl get service elbowpay -o yaml > svc.yaml

# delete deployment and services
kubectl delete deployment elbowpay
kubectl delete service elbowpay

# list cluster
aws eks list-clusters --region us-east-1

# delete cluster
eksctl delete cluster --name demo-cluster --region us-east-1

```