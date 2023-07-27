# #90DaysOfDevOps Challenge - Day 38 - Getting Started with AWS Basics

Welcome to Day 38 of the #90DaysOfDevOps challenge! Today, we will dive into the basics of Amazon Web Services (AWS) and explore some essential tasks to get you started. Let's get started with AWS!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687462464246/74e121e5-2b87-4d69-b33d-eb54ee89b796.webp)

## Amazon Web Services (AWS)

**Amazon Web Services (AWS)** is a leading cloud provider globally, offering a comprehensive suite of services and solutions to businesses and individuals. With a vast range of services, including computing, storage, networking, databases, AI, and more, AWS empowers organizations to build scalable, reliable, and secure applications and infrastructure in the cloud.

AWS provides a **free tier** that allows users to explore and experiment with various services at no cost for a limited period. This free tier is particularly beneficial for students and cloud enthusiasts who want to gain hands-on experience and learn about AWS services.

To get started with AWS, you can create a free account today by visiting the AWS website. By signing up, you will gain access to the AWS Management Console, where you can provision resources, launch instances, configure services, and manage your cloud environment.

To further enhance your understanding of AWS services and explore their capabilities, you can refer to the official AWS documentation. The documentation provides detailed information, tutorials, examples, and best practices for utilizing different AWS services effectively.

## IAM (Identity and Access Management)

AWS Identity and Access Management (IAM) is a powerful web service that enables you to control and manage access to your AWS resources. IAM allows you to create and manage users, groups, and roles, and assign specific permissions to control their access to AWS services and resources.

With IAM, you can implement a robust security model by enforcing the principle of least privilege. This means granting users or entities only the permissions they need to perform their tasks and restricting unnecessary access. IAM provides granular control over resource permissions, allowing you to define fine-grained policies and manage authentication and authorization for your AWS environment.

By leveraging IAM, you can ensure secure access to AWS resources, protect sensitive data, enforce multi-factor authentication, and audit user activity. IAM integrates seamlessly with other AWS services, providing a unified and centralized approach to managing access control across your AWS infrastructure.

To delve deeper into IAM and its functionalities, AWS offers comprehensive documentation on IAM best practices, policies, user management, and security configurations. Exploring the official IAM documentation will provide you with valuable insights into securing your AWS environment and implementing effective access control measures.

## Task 1 - Creating an IAM User and Launching a Linux Instance

1. Sign in to the AWS Management Console and navigate to the IAM service.
    
2. Click on "Users" in the left navigation pane and then click on "Add users".
    
3. Enter a username of your choice and hit Next.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688053895964/aebbfb7f-8a99-46fc-bf90-1f05627e0c9a.jpeg)
    
4. On the permissions page, select "Attach existing policies directly" and search for "AmazonEC2FullAccess". Check the box next to it and proceed.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688053932793/c0688c88-9fd0-4486-9477-037a0156acde.jpeg)
    
5. Complete the user creation process.
    
6. Launch a Linux instance by following these steps:
    
    * Go to the EC2 service in the AWS Management Console.
        
    * Click on "Launch Instance" and select an Amazon Machine Image (AMI) of your choice.
        
    * Choose an instance type, configure the instance details, and add storage as per your requirements.
        
    * Configure security groups to allow SSH access.
        
    * Review the instance details and launch the instance.
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688054172870/e0ac15a2-6feb-4fdc-bf47-553ccac2d0e9.jpeg)
    
7. Once the instance is running, connect using your preffered option. In this case, I will use EC2 Instance Connect.
    
8. Install Jenkins and Docker on the Linux instance using a single shell script. You can create a shell script locally and copy it to the instance using the SCP command or any other method of your choice. Run the shell script on the instance to install Jenkins and Docker.
    
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
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688056551496/d70b87b5-11e6-481a-8a8b-e8fbaed1fd57.jpeg)
    
    Here we can see both Jenkins and Docker are installed and running:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688056643518/9ad9edbc-8c1f-407a-8d21-e81beae1bc8a.jpeg)
    

## Task 2 - Building an Avengers DevOps Team

1. In the AWS Management Console, navigate to the IAM service
    
2. Click on "Policies" in the left navigation pane and then click on "Create Policy".
    
3. Specify the permissions you want to give to this policy. Provide a name and description for the policy.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688058015271/4566a12a-ce15-45cf-9264-ad7aeeed436c.jpeg)
    
4. Go back to the IAM service and create three IAM users, assigning usernames representing Avengers characters (e.g., Ironman, Thor, Hulk) to each user.
    
5. Return to the IAM service and click on "User Groups" in the left navigation pane. Specify a name for the group, add the previously created users to the group, assign the IAM policy created in step 3, and then click on "Create Group".
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688058379853/067b0bd7-aa27-4e5a-97bb-2683f98c830a.jpeg)
    

Congratulations. You have successfully completed the tasks for Day 38 of the #90DaysOfDevOps challenge. Stay tuned for more AWS content on Day 39, where we will dive into IAM