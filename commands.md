# Docker Command Cheat Sheet

## Verify Docker Installation

```bash
docker --version
docker info
```

---

## Run Your First Container

```bash
docker run hello-world
```

---

## Images

### Download an Image

```bash
docker pull ubuntu
docker pull nginx
```

### List Images

```bash
docker images
```

### Remove an Image

```bash
docker rmi <image_id>
```

Example:

```bash
docker rmi ubuntu
```

---

## Containers

### Run a Container

```bash
docker run ubuntu
```

### Run Interactive Container

```bash
docker run -it ubuntu bash
```

### Run Container in Background

```bash
docker run -d nginx
```

### Run Container with Port Mapping

```bash
docker run -d -p 8080:80 nginx
```

---

## List Containers

### Running Containers

```bash
docker ps
```

### All Containers

```bash
docker ps -a
```

### Display Only Container IDs

```bash
docker ps -aq
```

---

## Start, Stop and Restart Containers

### Stop Container

```bash
docker stop <container_id>
```

### Start Container

```bash
docker start <container_id>
```

### Restart Container

```bash
docker restart <container_id>
```

---

## Remove Containers

### Remove One Container

```bash
docker rm <container_id>
```

Example:

```bash
docker rm abc123
```

### Remove Multiple Containers

```bash
docker rm container1 container2 container3
```

Example:

```bash
docker rm a1b2c3d4 e5f6g7h8 i9j0k1l2
```

### Force Remove Running Container

```bash
docker rm -f <container_id>
```

### Remove All Containers

```bash
docker rm -f $(docker ps -aq)
```

### Remove All Stopped Containers

```bash
docker container prune
```

---

## Logs

### View Logs

```bash
docker logs <container_id>
```

### Follow Logs

```bash
docker logs -f <container_id>
```

---

## Execute Commands Inside a Container

```bash
docker exec -it <container_id> bash
```

Example:

```bash
docker exec -it my-nginx bash
```

---

## Docker Volumes

### Create Volume

```bash
docker volume create mydata
```

### List Volumes

```bash
docker volume ls
```

### Use Volume

```bash
docker run -v mydata:/data ubuntu
```

### Remove Volume

```bash
docker volume rm mydata
```

---

## Bind Mounts

Mount Current Directory into Container

```bash
docker run -v $(pwd):/app python-app
```

---

## Docker Networks

### Create Network

```bash
docker network create mynetwork
```

### List Networks

```bash
docker network ls
```

### Remove Network

```bash
docker network rm mynetwork
```

---

## Dockerfile Commands

### Build Image

```bash
docker build -t myapp .
```

### Run Built Image

```bash
docker run myapp
```

### Run with Port Mapping

```bash
docker run -p 5000:5000 myapp
```

---

## Docker Compose

### Start Services

```bash
docker compose up
```

### Start in Background

```bash
docker compose up -d
```

### Stop Services

```bash
docker compose down
```

### View Running Services

```bash
docker compose ps
```

### View Logs

```bash
docker compose logs
```

---

## Cleanup Commands

### Remove Unused Containers, Networks and Cache

```bash
docker system prune
```

### Remove Everything Unused

```bash
docker system prune -a
```

### Remove Everything Including Volumes

```bash
docker system prune -a --volumes
```

**Warning:** This can permanently delete data.

---

## Troubleshooting

### Check Docker Service Status

Linux:

```bash
sudo systemctl status docker
```

### Start Docker Service

```bash
sudo systemctl start docker
```

### Enable Docker on Boot

```bash
sudo systemctl enable docker
```

### Check Docker Configuration

```bash
cat ~/.docker/config.json
```

### Backup Docker Configuration

```bash
mv ~/.docker/config.json ~/.docker/config.json.backup
```

---

## Most Useful Commands

```bash
docker --version
docker info

docker images
docker ps
docker ps -a

docker pull nginx
docker run nginx

docker run -it ubuntu bash

docker build -t myapp .
docker run myapp

docker logs <container_id>

docker exec -it <container_id> bash
docker exec -it <container_id> sh


docker stop <container_id>
docker start <container_id>

docker rm -f $(docker ps -aq)

docker volume ls
docker network ls

docker compose up -d
docker compose down

docker system prune -a
```

---

## Student Lab Exercise

### Objective

Dockerize a simple FastAPI application.

### Tasks

1. Create a FastAPI application.
2. Create a Dockerfile.
3. Build the Docker image.
4. Run the container on port 8000.
5. Test the API endpoint.
6. Push the image to Docker Hub.

### Learning Outcomes

* Docker Images
* Docker Containers
* Dockerfile
* Port Mapping
* Volumes
* Networking
* Docker Compose
* Container Deployment
* Docker Hub
* FastAPI Containerization

```
```
