# #90DaysOfDevOps Challenge - Day 85 - DevOps Project 6 - Deploying a Node.js App on AWS ECS Fargate and ECR

Welcome to Day 85 of the #90DaysOfDevOps Challenge. Today, we'll embark on an exciting project where we will deploy a Node.js app using AWS ECS Fargate and AWS ECR. This project will allow us to leverage the power of Amazon ECS (Elastic Container Service) and ECR (Elastic Container Registry) to efficiently manage and deploy containerized applications.

## Project Description

In this project, our goal is to deploy a Node.js application on AWS ECS Fargate and store its Docker image in AWS ECR. Amazon ECS (Elastic Container Service) is a fully managed container orchestration service that enables you to easily run, scale, and secure Docker containers on AWS. AWS Fargate is a serverless compute engine for containers, allowing you to focus on deploying your applications without having to manage the underlying infrastructure.

Before we start, you can read more about the tech stack we'll be using in this [link](https://faun.pub/what-is-amazon-ecs-and-ecr-how-does-they-work-with-an-example-4acbf9be8415). It will provide you with a better understanding of the AWS ECS and ECR services and their capabilities.

## Hands-on Project: Deploying a Node.js App on AWS ECS Fargate and ECR

### Step 1: Create EC2 Instance and Install AWS CLI and Docker

Create an EC2 instance and Install the AWS Command Line Interface (CLI) and Docker. I will use the below script and provide it via User Data to install at boot.

```bash
#!/bin/bash

echo "AWS CLI Installation"
echo "------------------------------------------------------------------"
sudo apt install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
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

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690813236637/7a4786cd-a4db-4196-ab51-c8df27718d50.jpeg align="center")

### Step 2: Clone the GitHub Repository

Start by obtaining the Node.js application from the GitHub repository provided. Clone it to your AWS EC2 instance where we will be configuring AWS ECR.

```bash
git clone https://github.com/estebanmorenoit/node-todo-cicd.git
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690813262656/b8fb1f4c-53c3-41d1-8e01-0b67831d5dae.jpeg align="center")

### Step 3: Configure AWS ECR

Navigate to the AWS Elastic Container Registry (ECR) and create a repository. Choose the repository type and name it accordingly. Select the necessary operating systems and versions that align with the Fargate setup.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690813802126/756ea7f7-d830-4c3c-a6cd-8ffce72f831a.jpeg align="center")

Verify the repository has been successfully created.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690813852025/d2269d6b-0f23-4ac7-85ed-d1e439b86cd8.jpeg align="center")

### Step 4: Set Up IAM

Create an IAM user in the AWS Management Console and attach the required policies for our project.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690814603399/fedf28c7-7cc0-4ecc-880d-dd7ef7e0b709.jpeg align="center")

### Step 5: Configure AWS CLI

Install the AWS Command Line Interface (CLI) on the AWS EC2 instance where the Node.js app resides. Connect the EC2 instance to the AWS Management Console using the AWS CLI.

```bash
aws configure
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690817977347/80b2332d-b43e-443f-8154-3f8705a7b820.jpeg align="center")

### Step 6: Push the Image to ECR

Navigate to the ECR repository created earlier and select "View push commands".

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690820508552/d9d42072-c44e-4443-ae28-c7f572ba159c.jpeg align="center")

Use the following steps to authenticate and push an image to your repository. For additional registry authentication methods, including the Amazon ECR credential helper, see the [Amazon ECR Official Documentation](http://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth).

1. Retrieve an authentication token and authenticate your Docker client to your registry. Use the AWS CLI:
    
    ```bash
    aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/r2k5e4z9
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690820726290/c688f377-4f7e-427c-a51a-1be49f0fdaec.jpeg align="center")
    
2. Build your Docker image using the following command. For information on building a Docker file from scratch, see the instructions [here](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html). You can skip this step if your image has already been built:
    
    ```bash
    docker build -t estebanmorenoit/node-todo-app .
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690820753680/d001810f-1dec-4b5a-b781-421ff45b7a66.jpeg align="center")
    
3. After the build is completed, tag your image so you can push the image to this repository:
    
    ```bash
    docker tag estebanmorenoit/node-todo-app:latest public.ecr.aws/r2k5e4z9/estebanmorenoit/node-todo-app:latest
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690820777271/419037db-9ad8-4b1b-bafa-b6ed392508cf.jpeg align="center")
    
4. Run the following command to push this image to your newly created AWS repository:
    
    ```bash
    docker push public.ecr.aws/r2k5e4z9/estebanmorenoit/node-todo-app:latest
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690820823645/728d108d-667f-4ba7-8423-c0e79c3d02b9.jpeg align="center")
    

### Step 7: Configure AWS ECS

Move on to the AWS Elastic Container Service (ECS) repository in the AWS console. Create a cluster with a relevant name, and choose the Virtual Private Cloud (VPC) and subnet where you want your application to be available.

To avoid the cost impact of multiple EC2 instances, we will use AWS Fargate, which is a serverless technique for managing applications without spinning off instances. Select AWS Fargate as the launch type for the cluster to run on.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690821060239/a9912e05-f39c-4169-8705-072d92a6ff95.jpeg align="center")

### Step 8: Create Task Definition

Create a task definition for your cluster. Provide the task name, container image details, and the ports for the application to run on. Make sure you have exposed a port in your Dockerfile.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690821462998/1c5833d3-4257-4b52-8562-aecb5916edd9.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690821485838/16b88d68-aed5-4bbd-8230-ae3463541d2f.jpeg align="center")

### Step 9: Review and Create a Task

Review all the details and create the task definition. Once created, the task will be ready for deployment.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690821545994/695b3172-67d4-411d-85d8-1075753563a0.jpeg align="center")

### Step 10: Deploy and Run the Task

Click on the "Deploy" button, and then choose "Run task" to deploy the task on the cluster. Select the cluster, and set the launch type to Fargate. Confirm the deployment.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690821663681/992c3f70-4e94-403c-9254-0a0ee1aa7960.jpeg align="center")

Verify the task is up and running.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690823569510/f5f58eb7-7174-461f-83c4-e4e5088cb0bd.jpeg align="center")

### Step 11: Open the Port in the Security Group

Ensure port 8000 is open in the Security Group used in our task.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690823440465/d9935b19-36e1-4d65-bc57-bdfce8872afe.jpeg align="center")

### Step 12: Project Live Execution

Finally, navigate to the task that was created, and take note of the public IP. Your Node.js app is now live and accessible!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690823597472/6ae3df08-b0b4-4595-9629-ae949f9d81ea.jpeg align="center")

Congratulations on completing Day 85 of the #90DaysOfDevOps challenge! In this project, we successfully deployed a Node.js app on AWS ECS Fargate and ECR, leveraging the power of AWS cloud services. This project showcased how to efficiently manage containerized applications with AWS services, ensuring high availability and scalability while reducing operational overhead. Stay tuned for tomorrow's challenge, where we'll dive into another exciting project!