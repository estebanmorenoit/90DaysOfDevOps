# #90DaysOfDevOps Challenge - Day 83 - DevOps Project 4 - Web Application Deployment Using Docker Swarm

Welcome to Day 83 of the #90DaysOfDevOps Challenge. Today's project takes us on an exciting journey of deploying a web application with Docker Swarm. This powerful orchestration tool empowers us to manage containers at scale, ensuring robustness and high performance for our applications. Let's get started!

## Project Description

In this project, we will explore the deployment of a web application using **Docker Swarm**, a powerful container orchestration tool. Docker Swarm enables the seamless management and scaling of containerized applications, making it an ideal choice for production environments. Leveraging Docker Swarm's features, such as **load balancing**, **rolling updates**, and **service discovery**, we aim to achieve **high availability** and **reliability** for our web application.

The key steps involved in this project include pulling an existing Docker image from DockerHub and deploying it onto a Docker Swarm cluster. By setting up the Swarm cluster, we will benefit from automated **failover**, **load balancing**, and **horizontal scaling** capabilities, ensuring our application can efficiently handle varying workloads and demands.

Let's dive into the project and learn how Docker Swarm can enhance the deployment and management of containerized applications.

## Hands-on Project: Web Application Deployment Using Docker Swarm

In this hands-on project, we will guide you through the process of deploying a web application using **Docker Swarm**, a powerful container orchestration tool. Before we begin, make sure you have a Docker image of your web application stored on **DockerHub**.

### Pre-requisites:

To start, access the AWS portal and set up three new instances with Docker pre-installed. Use the following shell script and provide it in the EC2 User Data field:

```bash
#!/bin/bash

echo "Docker installation"
echo "------------------------------------------------------------------"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
sudo reboot
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476203695/58ab8514-22a9-4012-be4c-6f7baedb981d.jpeg align="center")

### Step 1: Set Up Docker Swarm Cluster

The first step is to set up a Docker Swarm cluster. If you haven't already, create a Docker Swarm cluster by initializing it on a manager node. Use the following command on the manager node:

```bash
docker swarm init
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690475716943/07dd6d1d-c732-4241-bcb4-adf7d492742a.jpeg align="center")

Once the swarm is initialized on the "swarm-manager" node, a key will be generated to add additional nodes as workers to the swarm. Copy and execute this key on the remaining servers to join them to the swarm.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476381718/f20674a3-5285-46e3-a577-23a569e8f17a.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476420193/dd8b20c4-f3ee-43f9-9a6c-b6aff6f75841.jpeg align="center")

We can see Docker Swarm uses port 2377, so we'll open this port in our Security Group.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476157983/22c750a7-8537-4254-ba81-d44a07891350.jpeg align="center")

To verify the connected worker nodes and manager nodes in the Docker swarm, you can use the command:

```bash
docker node ls
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476487251/30e80d72-e219-43f9-b12e-e892f6a063a3.jpeg align="center")

### Step 2: Deploy the Web Application

With the Docker Swarm cluster ready, it's time to deploy your web application using the Docker image stored on DockerHub. Use the following command to deploy the application as a service on the Swarm:

```bash
docker service create --name django-notes-app --replicas 3 -p 8000:8000 estebanmorenoit/django-notes-app:latest
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476708101/e1b1b3f5-8f21-4c88-a85e-c64cdaa63835.jpeg align="center")

### Step 3: Verify the Deployment

Once the service is deployed, you can verify its status and check if the desired number of replicas are running on the Swarm nodes. Use the following commands to see the running services:

```bash
docker service ls
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690476859991/55926279-e6e5-43ba-a3b0-20ebf8b05e65.jpeg align="center")

```bash
docker ps
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690477355389/e03f838a-2f9d-42d0-9e90-bde68904b574.jpeg align="center")

Now, the service is running on all three nodes. To verify this, navigate to `http://<ec2-instance-public-ip-address>:8000` using every instance IP Address.

* **swarm-manager**
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690477591434/e86ff329-4242-4751-bc13-b4090c13d5e3.jpeg align="center")
    
* **swarm-worker1**
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690477711456/14ef0f5d-9d88-4000-87d1-aa3aca2ae2dd.jpeg align="center")
    
* **swarm-worker2**
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690477744870/84ea9f35-4d2f-4869-9ac0-00ca718d85e0.jpeg align="center")
    

### Step 4: Clean-up

When you are done with the project, you can remove the service and leave the Swarm. To remove the service, use the following command from any worker node:

```bash
docker swarm leave
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690477866480/a1dec3a8-81a1-4c26-a050-70243d6fabe5.jpeg align="center")

After removing one of the workers, we can observe its status as "down" within the status information.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690477955395/b9522a91-58df-4699-9049-daa00df3327b.jpeg align="center")

To leave the Swarm, run the following command on the manager node:

```bash
docker swarm leave --force
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690478038482/de1c80ea-36e8-45a7-9ec4-21768b343f83.jpeg align="center")

Congratulations on completing Day 83 of the #90DaysOfDevOps challenge! We accomplished a significant milestone by deploying a web application using Docker Swarm. This experience has enriched our understanding of container orchestration and its role in modern DevOps practices. Tomorrow, get ready to level up as we dive into a new DevOps Project on Day 84. Stay tuned!