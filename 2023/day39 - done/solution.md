# #90DaysOfDevOps Challenge - Day 39 - AWS and IAM Basics

In Day 39 of the #90DaysOfDevOps Challenge, we will explore the fundamentals of AWS Identity and Access Management (IAM) and dive into user data in AWS EC2. IAM plays a crucial role in managing access to AWS resources, while user data allows us to automate instance configuration during launch.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688060576892/f7569cac-15ad-4e61-9189-984517c92310.jpeg)

## AWS Identity and Access Management (IAM)

IAM is a powerful service provided by AWS that enables you to manage user access and permissions within your AWS environment. It allows you to create and manage users, groups, and roles, and assign granular permissions to control their access to AWS resources. With IAM, you can enhance security and implement the principle of least privilege by granting only the necessary permissions to perform specific actions.

### IAM Roles, Users, and Groups are fundamental components of IAM

* **IAM Users:** These are individual identities created within your AWS account. Each user has a unique set of security credentials and can be assigned permissions to access and manage AWS resources.
    
* **IAM Groups:** Groups are a way to manage multiple users with similar access requirements. Instead of assigning permissions individually to each user, you can assign permissions to a group and add users to that group.
    
* **IAM Roles:** Roles are similar to users, but they are not tied to a specific identity. Roles are typically used to grant temporary access to AWS resources to entities like applications or services.
    

## User Data in AWS

User data in AWS EC2 provides a way to automate the configuration of instances during launch. By adding user data to an EC2 instance, you can execute scripts, install software, configure settings, and perform other customization tasks automatically. This helps in streamlining the setup process and achieving consistent configurations across multiple instances.

When you launch an instance in Amazon EC2, you have the option of passing user data to the instance that can be used to perform common automated configuration tasks and even run scripts after the instance starts. You can pass two types of user data to Amazon EC2: shell scripts and cloud-init directives.

You can also pass this data into the launch instance wizard as plain text, as a file (this is useful for launching instances using the command line tools), or as base64-encoded text (for API calls).

This will save time and manual effort everytime you launch an instance and want to install any application on it like apache, docker, Jenkins etc

## Task 1 - Launch EC2 Instance with Jenkins Installed

1. Go to the AWS Management Console and navigate to the EC2 service.
    
2. Click on "Launch Instance" and choose an appropriate AMI (Amazon Machine Image).
    
3. Select an instance type, configure instance details, and add any required storage.
    
4. In the "Network Settings", make sure the Security Group allows inbound traffic on port 8080 to access Jenkins.
    
5. Scroll down to the "Advanced Details" section. Enter the following script in the "User data" field to install Jenkins and Docker (Script from Day 38):
    

```bash
#!/bin/bash

# Update the system packages
sudo yum update –y

# Download and configure the Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade the system packages
sudo yum upgrade

# Install Java 11 using Amazon Corretto
sudo dnf install java-11-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y

# Enable and start the Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Docker
sudo yum install -y docker

# Enable and start the Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Check the status of Jenkins service
sudo systemctl status jenkins

# Check the status of Docker service
sudo systemctl status docker
```

1. Review the configuration, and launch the instance.
    
2. Once the instance is running, copy the public IP address.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688059874726/5ff8d716-7a7c-4931-83e1-8269e1d044de.jpeg)
    
3. Open a web browser and paste the IP Address using port 8080. You should see the Jenkins page.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688059881208/be391ed6-9a63-4163-8e5d-ef5cc91a7960.jpeg)
    

## Task 2 - Create Three Roles

1. Go to the AWS Management Console and navigate to the IAM service.
    
2. Click on "Roles" and then "Create Role".
    
3. Select the "Trusted Entity" and "Use case". In this example, I'll use "AWS Service" and "EC2"
    
4. On the permissions page, assign the necessary policies and permissions to the role based on its purpose. I will select "AmazonEC2FullAccess"
    
5. Give the role a name, such as "DevOps-User".
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688060267701/c0a3bd28-2595-4287-bacf-142b56cc9b6a.jpeg)
    
6. Repeat the above steps to create the roles "Test-User" and "Admin", assigning the relevant policies to each.
    

Congratulations on completing Day 39 of the #90DaysOfDevOps Challenge. Today, we explored AWS IAM, learning how to manage user access and permissions effectively. Tomorrow, get ready for AWS EC2 Automation as we explore automating provisioning and configuration. Stay tuned!