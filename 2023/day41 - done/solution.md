# #90DaysOfDevOps Challenge - Day 41 - Setting up an Application Load Balancer with AWS EC2

Welcome to Day 41 of the #90DaysOfDevOps Challenge. In today's session, we will explore the concept of load balancing and focus on setting up an Application Load Balancer (ALB) with AWS EC2. Load balancing is a critical component in distributed systems that helps distribute incoming network traffic across multiple resources, improving performance, scalability, and fault tolerance.

## What is Load Balancing?

Load balancing is a crucial technique used in modern IT infrastructures to efficiently distribute incoming network traffic across multiple servers or instances. The primary goal of load balancing is to ensure **optimal resource utilization** and prevent **overload** on a single server. By evenly distributing the traffic, load balancing improves the **overall performance** and **responsiveness** of applications, leading to a better **user experience**.

Load balancing also adds **redundancy** and **high availability** to the system. In case one server or instance becomes **unavailable** or experiences a **surge in traffic**, the load balancer can intelligently route the requests to the **available servers**. This helps to maintain the **availability** of the application and prevent **disruptions** caused by server failures.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688143546476/74c09261-0bd2-46e7-97ae-6b3cafc41766.png)

## Elastic Load Balancing

**Elastic Load Balancing** (ELB) is an **AWS service** designed to automatically distribute incoming application traffic across multiple targets within an **Amazon Web Services (AWS)** environment. It offers three types of load balancers to suit different application architectures:

### Application Load Balancer (ALB)

ALB operates at the application layer (Layer 7) of the OSI model and is ideal for distributing traffic to multiple services or containers based on specific **routing rules**. It supports advanced features such as **path-based routing**, **host-based routing**, and **content-based routing**, enabling flexible and granular traffic management.

### Network Load Balancer (NLB)

NLB operates at the transport layer (Layer 4) of the OSI model and is optimized for handling high volumes of traffic. It is capable of handling **millions of requests per second** with **ultra-low latency**. NLB is commonly used for TCP and UDP-based workloads that require extreme scalability and high performance.

### Classic Load Balancer (CLB)

CLB is the legacy load balancer provided by AWS. It operates at both the application and transport layers and offers **basic load-balancing capabilities**. While ALB and NLB provide more advanced features and better performance, CLB can still be suitable for simple applications or those that require backward compatibility.

With Elastic Load Balancing, you can easily set up, configure, and manage load balancers to distribute traffic across your application instances. The load balancer automatically **scales** and adapts to changing traffic patterns, ensuring **optimal performance** and **fault tolerance**. Additionally, ELB integrates seamlessly with other AWS services, such as Auto Scaling, to provide a robust and scalable infrastructure for your applications.

## Task 1 - Launching EC2 Instances and Installing Apache Web Server

1. Log in to the AWS Management Console and navigate to the EC2 service.
    
2. Click on "Launch Instance" to start the instance creation process.
    
3. Choose the Ubuntu AMI as the base image for your instances.
    
4. Select the desired instance type and configure other instance details as needed.
    
5. Continue through the remaining steps, configuring storage, security groups, and other settings as desired.
    
6. Scroll down to the "Advanced Details" section.
    
7. Enter the following script in the "User Data" field to install the Apache Web Server:
    
    ```bash
    #!/bin/bash
    sudo apt update
    sudo apt install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    ```
    
8. Launch the instances and wait for them to become running.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688213413544/bf84d4d7-9c8b-458f-8546-18a79c0f7b98.jpeg)
    
9. Do the same for the second instance
    
10. Connect to the instances and modify the index.html file located in the Apache document root (/var/www/html).
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688214158940/dad7a9ab-8acc-45f0-865d-a4a44f3682de.jpeg)
    
11. Replace the default content with your name and something else to differentiate instance 1 and instance 2.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688214645705/9c1f3830-b337-46c7-a5be-e3f534363c99.jpeg)
    
12. Save the file.
    
13. Once the instances are running, navigate to the EC2 dashboard and locate the public IP addresses of the instances.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688214508020/77f0582c-3e96-4a7f-b98c-ce43431d8398.jpeg)
    
14. Open a web browser and enter the first instance's public IP address. You should see the Apache default page.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688214852933/f6bb0ba0-9ca7-4deb-b052-655d982a667a.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688214858777/6ba1b14f-2210-4f2c-b08f-7ffbfed4aa20.jpeg)
    

## Task 2 - Creating an Application Load Balancer (ALB)

1. In the AWS Management Console, navigate to the EC2 service.
    
2. Click on "Load Balancers" in the left navigation pane and then click on "Create Load Balancer."
    
3. Choose "Application Load Balancer" as the load balancer type and click "Create."
    
4. Configure the ALB with a unique name, listener configuration, and select the appropriate VPC.
    
5. Specify the Availability Zones where the ALB should distribute traffic.
    
6. Set up the security groups to allow incoming traffic to the ALB.
    
7. In the "Configure Routing" section, create a new target group and specify the instances launched in Task 1 as targets.
    
8. Configure health checks to monitor the status of the instances.
    
9. Complete the ALB creation process and wait for it to become active.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688217598743/e2b846c2-b80c-4b0f-9d0a-44e25ef1d09a.jpeg)
    
10. Once the ALB is active, test its functionality by accessing the ALB's DNS name in a web browser.
    
11. Verify that the traffic is being distributed to the instances and that the modified content is displayed.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688217630473/0d57abcf-927b-435c-99bd-963cb1a23e1c.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688217651363/1213a287-5010-428c-b2f8-7731259b9902.jpeg)
    

You have successfully launched EC2 instances, installed the Apache Web Server, and created an Application Load Balancer (ALB) to distribute traffic to the instances.

Congratulations on completing Day 41. By setting up an Application Load Balancer with AWS EC2, you have taken a significant step towards building scalable and highly available applications. Stay tuned for more exciting AWS content in the upcoming days.