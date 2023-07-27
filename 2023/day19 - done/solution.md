# #90DaysOfDevOps Challenge - Day 19 - Docker for DevOps Engineers (Docker Volume and Docker Network)

Welcome to Day 19 of the #90DaysOfDevOps Challenge. Today, we will explore two important concepts in Docker: Docker Volume and Docker Network. These features enable us to manage data persistence and establish communication between containers efficiently. Let's dive into the details.

## **Docker Volume**

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686317610878/00f6ae05-6b51-4496-9131-71d5529fdbdc.png)

In **Docker**, a **volume** is a directory that is stored outside the container's filesystem. It allows us to persist data and **share** it between **containers** or between the **host** machine and containers. Docker volumes provide advantages such as **data persistence**, **improved container performance**, and **easier data management**.

When a container is created, Docker sets up a writable storage layer. However, any changes made to this storage layer will not persist if the container is deleted or replaced. This is where Docker volumes come into play. Volumes provide a way to store and manage data separately from the container itself.

Docker volumes can be used in various scenarios. For example, they are commonly used to **store application data,** **configuration files**, **logs**, or any **other data** that needs to be **persistent**. By utilizing volumes, we can ensure that our data remains intact even if the container is restarted or replaced.

Additionally, Docker volumes can be shared between multiple containers, enabling efficient data exchange. This is particularly useful in microservices architectures, where different containers need access to shared data.

To use Docker volumes, we can specify the `-v` or `--volume` flag when running a container, followed by the source and destination paths. For example:

```bash
docker run -v /host/path:/container/path image_name
```

This command mounts a volume from the host machine to a specific path inside the container. Any changes made to the data in that path will be reflected in both the container and the host. By specifying different paths, we can easily share and persist data between containers.

In addition to using volumes with `docker run`, Docker provides commands like `docker volume create`, `docker volume inspect`, and `docker volume rm` to manage volumes and perform operations such as creating, inspecting, and removing volumes.

Docker volumes are a powerful feature that enhances data management and facilitates seamless communication between containers.

## **Docker Network**

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686317664429/0a93cb7b-9629-4ff5-995e-4859a9f86e84.png)

**Docker Network** facilitates **communication** between containers and connects them with the outside world. By **default**, Docker creates a **bridge network** for containers to communicate with each other. Additionally, Docker supports **other network types** like **host**, **overlay**, and **macvlan**, allowing flexible networking configurations based on your application requirements.

When containers are connected to a network, they can communicate with each other using container names as hostnames. This simplifies the process of establishing communication between containers, as Docker takes care of name resolution and routing.

Docker networks also enable containers to communicate with external systems or services. By exposing ports on the host machine and mapping them to container ports, we can access containers from the host or other machines on the network.

In addition to the default bridge network, Docker provides other network drivers to suit different networking scenarios. For example, the host network driver allows a container to share the network namespace with the host, eliminating the need for network address translation (NAT) and providing better performance.

**Overlay** networks are used in **distributed environments** where containers need to **communicate across multiple hosts**. They enable seamless communication between containers running on different hosts by abstracting the underlying network infrastructure.

**Macvlan** networks allow containers to have their **own MAC addresses**, making them appear as separate physical devices on the network. This is useful when containers need to be directly connected to the physical network.

By understanding and utilizing Docker networks effectively, we can create **flexible and scalable architectures** for our containerized applications.

Now that we have explored the concepts of Docker Volume and Docker Network, let's proceed to the tasks to gain hands-on experience in using them.

## Task 1: Creating a Multi-Container Docker-Compose File

To manage multiple containers effortlessly, we will use Docker Compose. Follow the steps below:

1. ### Write a docker-compose.yml file defining the services for your application and database containers.
    
    ```yaml
    version : "3.3"
    services:
      web:
        image: varsha0108/local_django:latest
        deploy:
            replicas: 2
        ports:
          - "8001-8005:8001"
        volumes:
          - my_django_volume:/app
      db:
        image: mysql
        ports:
          - "3306:3306"
        environment:
          - "MYSQL_ROOT_PASSWORD=test@123"
    volumes:
      my_django_volume:
        external: true
    ```
    
    The given `docker-compose.yaml` file defines a multi-service Docker application with two services:
    
    1. **Web service**:
        
        * Uses the image `varsha0108/local_django:latest`.
            
        * Deploys two replicas.
            
        * Maps host ports 8001-8005 to container port 8001.
            
        * Mounts the external volume `my_django_volume` to `/app` in the container.
            
    2. **DB service**:
        
        * Uses the `mysql` image.
            
        * Maps host port 3306 to container port 3306.
            
        * Sets the root password as `test@123` using an environment variable.
            
    
    The application utilizes Docker volumes for persistent storage, and the `my_django_volume` volume is assumed to be created externally. If not, use the below command:
    

```bash
docker volume create my_django_volume
```

1. ### Use the `docker-compose up -d` command to start the containers in detached mode.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686338022630/69cd2578-00a8-447e-9aac-9d33206b4911.jpeg)
    
2. ### Employ the `docker-compose scale` command to scale the number of replicas for specific services or enable auto-scaling by adding the `replicas` parameter in the deployment file.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686338064048/36788f3c-229f-4b66-90b3-5e40689578a7.jpeg)
    
3. ### Verify the container status using `docker compose ps` and view logs using `docker compose logs`.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686338095358/b0625233-221f-437e-813b-d34e092d5f95.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686338121074/eb39e2d8-5a9c-431b-ba67-7d2b25d15bf5.jpeg)
    
4. ### Finally, use `docker compose down` to stop and remove all containers, networks, and volumes associated with the application.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686338152244/77a80d04-d67d-4fc4-818b-d5788114a00b.jpeg)
    

## Task 2: Using Docker Volumes

To share data between containers using Docker Volumes, follow these steps:

1. Create a new volume
    
    ```bash
    docker volume create ubuntu_volume
    docker volume ls
    docker volume inspect ubuntu_volume
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686394528275/c42949a7-be1d-4d19-bf42-ee7a0d859e0f.jpeg)
    
2. Create two or more containers that need to read and write data. Use the below command to specify the same volume configuration for each container.
    
    ```bash
    docker run -d --name nginx_container_1 -v ubuntu_volume:/app nginx:latest
    docker run -d --name nginx_container_2 -v ubuntu_volume:/app nginx:latest
    docker ps
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686395591246/85d22b93-ec4f-4459-a7f8-4e63dfbbfd86.jpeg)
    
3. Verify data consistency by executing commands inside each container using `docker exec`.
    
    ```bash
    docker exec -it dabd72adfc2e bash
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686396344782/af9f10cd-0e99-4f64-9dda-15b887d81dfa.jpeg)
    
    I have created a new file called `'volume-test.txt'` while connected to `nginx_container_1`. Let's connect to `nginx_container_2` and verify the text file is there.
    
    ```bash
    docker exec -it nginx_container_2 bash
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686396479134/09d7f8a2-7ffc-4e93-9997-fe3891fa099f.jpeg)
    
    In this example, we have used the `container ID` and the `container name` with the `docker exec` command to verify the content of the volume
    
4. Utilize `docker volume ls` to list all volumes and `docker volume rm` to remove the volume once you have finished using it.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686396691670/0d3e815b-7896-41bb-92b5-c193989fd080.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686396823203/c4989773-bc74-4198-9a3c-dc302f55960c.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686396861542/4b4bdf3d-7269-4233-9c1c-ffa29b901a5c.jpeg)
    

Congratulations on completing Day 19 of the #90DaysOfDevOps challenge. In Day 19, we focused on further exploring Docker for DevOps Engineers. We learned how to work with Docker volumes to persist data across containers and how to scale our services using the Docker Compose scale command.

Moving on to Day 20, we will review the Docker commands we have learned so far and create a comprehensive Docker cheatsheet. This cheatsheet will serve as a handy reference guide for you to quickly access and use Docker commands effectively in your DevOps workflows. Stay tuned!