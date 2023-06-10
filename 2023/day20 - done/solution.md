# #90DaysOfDevOps Challenge - Day 20 - Docker for DevOps Engineers Wrap up

Welcome to Day 20 of the #90DaysOfDevOps challenge. In today's article, we will wrap up our exploration of Docker for DevOps Engineers and provide you with a handy Docker cheat sheet filled with examples and tips. Let's dive in.

## **📄 Docker Advanced Command Cheat Sheet 🐳**

### Image Management

* `docker pull <image_name>:<tag>`: Pull an image from Docker Hub.
    
* `docker images`: List downloaded images.
    
* `docker rmi <image_id>`: Remove an image.
    

### Container Management:

* `docker run <image_name>`: Run a container from an image.
    
* `docker run -d <image_name>`: Run a container in detached mode.
    
* `docker ps`: List running containers.
    
* `docker ps -a`: List all containers (including stopped ones).
    
* `docker stop <container_id>`: Stop a running container.
    
* `docker rm <container_id>`: Remove a container.
    

### Docker Compose:

* `docker-compose up`: Start the containers defined in the Docker Compose file.
    
* `docker-compose down`: Stop and remove the containers defined in the Docker Compose file.
    

### Volume Management:

* `docker volume create <volume_name>`: Create a new volume.
    
* `docker volume ls`: List all volumes.
    
* `docker volume inspect <volume_name>`: Display detailed information about a volume.
    
* `docker volume rm <volume_name>`: Remove a volume.
    

### Network Management:

* `docker network create <network_name>`: Create a new network.
    
* `docker network ls`: List all networks.
    
* `docker network inspect <network_name>`: Display detailed information about a network.
    
* `docker network rm <network_name>`: Remove a network.
    

### Logging and Troubleshooting:

* `docker logs <container_id>`: Fetch the logs of a container.
    
* `docker exec -it <container_id> <command>`: Execute a command inside a running container.
    
* `docker inspect <container_id>`: Display detailed information about a container.
    
* `docker stats`: Display real-time CPU, memory, and network usage of containers.
    

### Image and Container Cleanup:

* `docker system df`: Show Docker disk usage.
    
* `docker system prune`: Remove unused data such as stopped containers, unused networks, and dangling images.
    
* `docker image prune`: Remove unused images.
    
* `docker container prune`: Remove stopped containers.
    

### Registry and Authentication:

* `docker login`: Log in to a Docker registry.
    
* `docker logout`: Log out from a Docker registry.
    
* `docker push <image_name>:<tag>`: Push an image to a Docker registry.
    

### Tips and Best Practices

* Use descriptive names for containers, images, and volumes.
    
* Keep your Dockerfile and docker-compose.yml files in version control for easier management and collaboration.
    
* Use environment variables in your Docker Compose files for dynamic configurations.
    
* Regularly clean up unused containers, images, and volumes to free up disk space.
    
* Explore Docker Hub and official repositories for pre-built images.
    

Congratulations on completing Day 20 of the #90DaysOfDevOps challenge. Throughout this article, I have provided you with a Docker cheat sheet containing essential commands and tips for effective Docker usage. By referencing this cheatsheet, you'll be able to streamline your Docker workflows and work more efficiently as a DevOps Engineer.

Stay tuned for Day 21, where we will review the Docker Important interview Questions. Stay tuned!