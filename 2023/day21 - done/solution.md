# #90DaysOfDevOps Challenge - Day 21 - Docker Important interview Questions

Welcome to Day 21 of the #90DaysOfDevOps challenge! Today, we will dive into some important interview questions related to Docker. Whether you're preparing for a job interview or simply looking to enhance your Docker knowledge, these questions will help you solidify your understanding of Docker concepts. So, let's get started!

## Questions

### 1 - What is the difference between an Image, Container, and Engine?

* **Image**: An image is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including the code, runtime, libraries, and dependencies.
    
* **Container**: A container is a runtime instance of an image. It is an isolated and portable environment that runs applications consistently across different platforms and environments.
    
* **Engine**: The Docker Engine is a client-server application that enables the creation and management of Docker containers. It provides the necessary tools to build, distribute, and run containers efficiently.
    

### 2 - What is the difference between the Docker command COPY vs ADD?

* The `COPY` command is used to copy files and directories from the host system to the container. It can only copy local files and directories.
    
* The `ADD` command, in addition to copying files and directories, also allows you to extract compressed files and retrieve files from remote URLs. It has a few more capabilities compared to `COPY`, but it is recommended to use `COPY` for simple file copying operations.
    

### 3 - What is the difference between the Docker command CMD vs RUN?

* The `RUN` command is used to execute commands during the image build process. It is primarily used for installing dependencies, configuring the image, and performing other setup tasks.
    
* The `CMD` command is used to provide the default command or executable to run when a container is started from an image. It specifies the main process to be executed in the container.
    

### 4 - How Will you reduce the size of the Docker image?

* Use lightweight base images like Alpine Linux instead of full-fledged operating systems.
    
* Minimize the number of layers in your Dockerfile by combining multiple commands into a single RUN instruction.
    
* Clean up temporary files and unnecessary dependencies after running installation commands.
    
* Use multi-stage builds to separate the built environment from the runtime environment.
    
* Optimize image layers by ordering the commands from least frequently changing to most frequently changing.
    

### 5 - Why and when to use Docker?

* Docker provides a consistent and reproducible environment for software applications, making it easier to develop, deploy, and scale applications across different environments.
    
* Docker enables the isolation of applications and their dependencies, ensuring that they run consistently regardless of the underlying infrastructure.
    
* Docker simplifies the process of packaging applications and their dependencies into portable and lightweight containers, reducing deployment time and improving scalability.
    

### 6 - Explain the Docker components and how they interact with each other.

* **Docker Daemon**: The Docker daemon is the background service responsible for building, running, and managing Docker containers.
    
* **Docker Client**: The Docker client is a command-line interface (CLI) tool used to interact with the Docker daemon. It sends commands to the daemon, which then executes them.
    
* **Docker Images**: Docker images are read-only templates used to create containers. They contain the application code, runtime, libraries, and dependencies required to run the application.
    
* **Docker Containers**: Docker containers are the runtime instances of Docker images. They encapsulate the application and its dependencies, providing isolation and portability.
    
* **Docker Registry**: Docker registries are repositories for storing and distributing Docker images. Docker Hub is the default public registry, but you can also set up private registries.
    
* **Docker Compose**: Docker Compose is a tool for defining and running multi-container Docker applications. It uses a YAML file to configure the application's services, networks, and volumes.
    

### 7 - Explain the terminology: Docker Compose, Docker File, Docker Image, Docker Container?

* **Docker Compose**: Docker Compose is a tool that allows you to define and manage multi-container Docker applications. It uses a YAML file to specify the services, networks, and volumes required for the application.
    
* **Docker File**: A Dockerfile is a text file that contains instructions for building a Docker image. It specifies the base image, required dependencies, and commands to configure the image.
    
* **Docker Image**: A Docker image is a lightweight, portable, and self-sufficient software package that includes everything needed to run an application, including the code, runtime, libraries, and dependencies.
    
* **Docker Container**: A Docker container is a runtime instance of a Docker image. It provides an isolated and reproducible environment for running applications.
    

### 8 - In what real scenarios have you used Docker?

Share your experiences and provide examples of how you have utilized Docker in your previous projects or personal development. Discuss scenarios such as deploying microservices, creating development environments, or setting up CI/CD pipelines.

### 9 - Docker vs Hypervisor?

Docker and Hypervisor are both technologies used for virtualization, but they operate at different levels.

**Hypervisors** virtualize hardware resources and allow the simultaneous execution of multiple operating systems on a single physical host.

**Docker**, on the other hand, provides containerization, which allows for lightweight and isolated execution of applications without the need for full virtual machines.

Docker containers share the host system's kernel, making them more efficient and lightweight compared to virtual machines.

### 10 - What are the advantages and disadvantages of using Docker?

**Advantages**:

* **Portability**: Docker containers can run on any system with Docker installed, providing consistent behaviour across different environments.
    
* **Scalability**: Docker enables easy scaling of applications by running multiple containers and distributing the load.
    
* **Isolation**: Containers provide process-level isolation, ensuring that applications do not interfere with each other.
    
* **Resource Efficiency**: Docker containers have low overhead and share the host system's resources, making them lightweight and efficient.
    

**Disadvantages**:

* **Learning Curve:** Docker has a learning curve, especially for beginners who are new to containerization.
    
* **Security:** Misconfigured containers or insecure images can pose security risks if not properly managed.
    
* **Compatibility:** Some applications may require modifications or adjustments to run in Docker containers.
    

### 11 - What is a Docker namespace?

Docker namespaces provide isolation and separation for various system resources within a container. They ensure that containers have their own isolated instances of resources such as process IDs, network interfaces, mount points, and more.

### 12 - What is a Docker registry?

A Docker registry is a repository that stores Docker images. It can be either a public registry (like Docker Hub) or a private registry. Registries allow users to share and distribute Docker images across different environments.

### 13 - What is an entry point?

An entry point is a configuration option in Docker that specifies the command or executable to run when a container starts. It sets the main process for the container.

### 14 - How to implement CI/CD in Docker?

CI/CD (Continuous Integration/Continuous Deployment) in Docker involves automating the build, test, and deployment processes using tools like Jenkins, GitLab CI/CD, or Travis CI. Docker images are built, tested, and deployed to various environments based on predefined pipelines.

### 15 - Will data on the container be lost when the Docker container exits?

By default, any data written inside a container's writable layer will be lost when the container exits. However, you can use Docker volumes or bind mounts to persist data outside the container, ensuring it is not lost.

### 16 - What is a Docker swarm?

\* Docker Swarm is a native clustering and orchestration tool provided by Docker. It allows you to create and manage a swarm of Docker nodes (hosts) to deploy and scale applications across multiple machines.

### 17 - What are the Docker commands for the following:

* **View running containers**: `docker ps`
    
* **Run a container under a specific name**: `docker run --name container_name image_name`
    
* **Export a Docker image**: `docker save -o output_file.tar image_name`
    
* **Import an already existing Docker image**: `docker load -i input_file.tar`
    
* **Delete a container**: `docker rm container_id`
    
* **Remove all stopped containers, unused networks, build caches, and dangling images**: `docker system prune -a`
    

### 18 - What are the common Docker practices to reduce the size of the Docker Image?

* Use a lightweight base image.
    
* Minimize the number of layers in your Dockerfile.
    
* Avoid unnecessary packages and dependencies.
    
* Remove temporary files and clean up after installation steps.
    
* Use multi-stage builds to separate the built environment from the runtime environment.
    
* Compress and optimize files within the image.
    
* Utilize Docker image layer caching effectively.
    

These questions will help you prepare for Docker-related interviews and deepen your understanding of Docker concepts. Make sure to review and practice them to build confidence in your Docker skills. Stay tuned for more exciting topics in the #90DaysOfDevOps challenge as we explore Jenkins on day 21.