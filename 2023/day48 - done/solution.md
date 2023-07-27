# #90DaysOfDevOps Challenge - Day 48 -  Amazon Elastic Container Service (ECS)

Welcome to Day 48 of the #90DaysOfDevOps Challenge. Today, we'll explore Amazon Elastic Container Service (ECS), a powerful container orchestration service provided by AWS. Discover what ECS is, its benefits, and how it compares to Elastic Kubernetes Service (EKS). Let's dive in!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688498739700/2d0c63bd-d19a-4633-b923-1c0b94b0c3ba.png)

## What is Amazon ECS?

Amazon ECS (**Elastic Container Service**) is a fully-managed container orchestration service provided by **Amazon Web Services (AWS)**. It allows you to run and manage **Docker containers** on a cluster of virtual machines (**EC2 instances**) without having to worry about managing the underlying infrastructure.

With ECS, you can effortlessly deploy, manage, and scale your containerized applications using the **AWS Management Console**, the **AWS CLI**, or the **API**. The service supports both "**Fargate**" and "**EC2 launch types**," giving you the flexibility to run your containers on AWS-managed infrastructure or your own EC2 instances.

ECS seamlessly integrates with other AWS services, such as **Elastic Load Balancing**, **Auto Scaling**, and **Amazon VPC**, enabling you to build scalable and highly available applications. Moreover, ECS supports **Docker Compose** and **Kubernetes**, simplifying the adoption of existing container workflows.

In essence, Amazon ECS is a powerful and flexible container orchestration service that streamlines the deployment and management of containerized applications in AWS.

## Difference between EKS and ECS

**EKS** (**Elastic Kubernetes Service**) and **ECS** (**Elastic Container Service**) are both container orchestration platforms provided by **Amazon Web Services (AWS)**. Although both platforms enable running containerized applications in the AWS cloud, there are some notable differences between them.

**Architecture**: ECS follows a centralized architecture, where a control plane manages the scheduling of containers on EC2 instances. Conversely, EKS is based on a distributed architecture, with the Kubernetes control plane distributed across multiple EC2 instances.

**Kubernetes Support**: EKS is a fully managed Kubernetes service, natively supporting Kubernetes and allowing you to run your Kubernetes workloads on AWS without managing the Kubernetes control plane. In contrast, ECS has its own orchestration engine and does not offer native Kubernetes support.

**Scaling**: EKS automatically scales your Kubernetes cluster based on demand, while ECS requires you to configure scaling policies for your tasks and services.

**Flexibility**: EKS provides more flexibility in terms of container orchestration, allowing you to customize and configure Kubernetes to meet your specific requirements. ECS is more restrictive in terms of the options available for container orchestration.

**Community**: Kubernetes boasts a large and active open-source community, resulting in EKS benefiting from a wide range of community-driven development and support. ECS, on the other hand, has a smaller community and is primarily driven by AWS itself.

In summary, if you prefer using Kubernetes to manage your containerized workloads on AWS, **EKS** is the way to go. However, if you seek a simpler, more managed platform for running your containerized applications, **ECS** is an excellent choice.

## Task 1: Setting up Nginx on Amazon ECS

### Step 1: Create an ECS Task Definition

1. Open the Amazon ECS console.
    
2. Click on "Task Definitions" in the navigation pane.
    
3. Click on the "Create new Task Definition" button. Enter a name for your task definition.
    
4. Define the container for Nginx, specifying the container image, port mappings, environment variables, and any other required configurations. The image can be found in the [Amazon ECR Public Gallery](https://gallery.ecr.aws/nginx/nginx)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688889574654/313141ed-6204-4186-8008-c8dff67a7014.jpeg)
    
5. Choose the launch type compatibility (EC2 or Fargate) for your task definition and configure the task resources, such as CPU and memory limits.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688889716449/6c3e2945-55f4-4e65-b44a-1f8feb8f0157.jpeg)
    
6. Review the settings and click on the "Create" button to create the task definition.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688889765538/89f8e0c8-51a4-412b-b22d-28e893ada7f7.jpeg)
    

### Step 2: Set Up an ECS Cluster

1. In the Amazon ECS console, click on "Clusters" in the navigation pane.
    
2. Click on the "Create Cluster" button.
    
3. Configure the cluster settings, select the VPC and subnets for your cluster.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688889932932/01be5b80-57d0-4db9-907e-b9920abcacae.jpeg)
    
4. Review the settings and click on the "Create" button to create the cluster.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688890112473/ccb6827a-70fa-47e5-a78a-b2d4b2d59eca.jpeg)
    

### Step 3: Create an ECS Service

1. In the Amazon ECS console, select your cluster.
    
2. Click on the "Create" button next to "Services".
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688890158114/fef09ce1-3fdb-4b85-9b0a-d489b6b69d0a.jpeg)
    
3. Configure the service settings, such as the service name, etc.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688890261115/ed3f51e8-b60a-4185-89b9-ecac115de8e3.jpeg)
    
4. Choose the previously created task definition for your service.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688890280592/a723fca3-ffbc-4137-81c7-40d270b8906a.jpeg)
    
5. Configure the network settings and security group. Ensure port 80 is open to run Nginx.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688890380135/4264b364-7d91-43b8-81c4-cfb142923e45.jpeg)
    
6. Configure Load Balancing.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688890855581/f18fdba5-4417-4602-b8f2-8e16abedc68c.jpeg)
    
7. Review the settings and click on the "Create Service" button to create the service.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688891109812/7dd988c0-18e7-4473-8895-e593681d1462.jpeg)
    

### Step 5: Test the Deployment

1. Obtain the DNS name of the Application Load Balancer (ALB) you created.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688891138812/249081a2-29cf-4b45-aa5c-a775ed1bf981.jpeg)
    
2. Open a web browser and enter the ALB's DNS name.
    
3. If everything is set up correctly, you should see the default Nginx landing page or any custom content you have configured.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688891174957/415885be-b9f1-43b8-9591-b67ae3bc0315.jpeg)
    

By following these steps, you will have successfully set up Nginx on Amazon ECS, allowing you to run and manage Nginx containers in a scalable and reliable manner.

Congratulations on completing Day 48 of the #90DaysOfDevOps Challenge. Today, we dived into Amazon Elastic Container Service (ECS) and discovered its power in orchestrating containerized applications on AWS. As we move forward to Day 49, get ready to sharpen your skills by exploring some AWS interview questions. Stay tuned!