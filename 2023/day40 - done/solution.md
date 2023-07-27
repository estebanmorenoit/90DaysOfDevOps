# #90DaysOfDevOps Challenge - Day 40 - AWS EC2 Automation

Welcome to Day 40 of the #90DaysOfDevOps Challenge! Today, we will delve into AWS EC2 automation and explore the power of launch templates, instance types, and AMIs for streamlined deployment and management of EC2 instances.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688142691644/85355a3a-b42a-44b3-93c2-21941f9f80a8.webp)

## Automation in EC2

Automation is a key aspect of utilizing the full potential of **Amazon EC2** (Elastic Compute Cloud). With EC2, you gain access to a secure, reliable, high-performance, and cost-effective computing infrastructure that can cater to even the most demanding business needs. However, to truly harness the power of EC2, **automation** becomes essential. By automating various tasks and processes, you can enhance operational efficiency, reduce manual errors, and ensure consistent configurations across your EC2 instances.

**Automation** enables you to streamline workflows such as instance provisioning, configuration management, scaling, and monitoring. Instead of performing these tasks manually, automation tools and practices allow you to define and execute them programmatically. This not only saves time but also ensures consistency and reproducibility in your infrastructure. Through automation, you can create scripts, templates, or use specialized tools to define and automate the deployment and management of EC2 instances, making it easier to handle large-scale deployments, achieve rapid scaling, and adapt to changing workload demands.

## Launch template in AWS EC2

A **launch template** is a powerful feature in AWS EC2 that simplifies the process of launching instances with consistent configurations. It allows you to define a set of pre-configured parameters and settings required to launch instances, such as the **Amazon Machine Image (AMI) ID**, **instance type**, network settings, storage options, and security groups. By creating a launch template, you can capture all these configurations in a reusable template, eliminating the need to manually specify them each time you launch an instance.

Launch templates offer flexibility and convenience. They enable you to create standardized configurations for different use cases, ensuring consistency and reducing the chances of configuration errors. Moreover, launch templates can be shared across teams or organizations, promoting collaboration and standardization in infrastructure deployments. With launch templates, you can easily replicate and launch instances with consistent settings, making it simpler to manage and scale your EC2 infrastructure.

## Instance Types

**Amazon EC2** provides a diverse range of **instance types**, each tailored to fulfill specific application requirements. Instance types are differentiated based on their performance characteristics, including **CPU power, memory capacity, storage capabilities**, and **network throughput**. This variety of instance types allows you to select the most appropriate configuration that aligns with the needs of your applications.

For example, **general-purpose instances** offer a balance of compute, memory, and networking resources, making them suitable for a wide range of applications. **Compute-optimized instances**, on the other hand, prioritize high-performance computing tasks by providing enhanced CPU capabilities. **Memory-optimized instances** are designed for memory-intensive workloads, offering a larger amount of RAM to accommodate data-intensive applications. Additionally, there are instances optimized for storage, GPU-accelerated instances for graphics-intensive workloads, and instances optimized for specific use cases like machine learning, database, or high-performance networking.

The availability of different instance types empowers you to optimize the performance, cost, and resource allocation for your applications. By selecting the appropriate instance type, you can ensure that your workloads run efficiently, with the right balance of computing resources to meet your specific needs.

## AMI (Amazon Machine Image)

An **Amazon Machine Image (AMI)** serves as the foundation for launching instances within AWS EC2. It is a pre-configured template that contains the necessary information to start an instance, including the operating system, software packages, configurations, and even data. AMIs provided by AWS are carefully curated and maintained, ensuring their reliability and security.

When launching an instance, you must select an appropriate AMI that aligns with your desired configuration and requirements. AWS offers a wide range of AMIs, including various operating systems (such as Amazon Linux, Ubuntu, and Windows Server), software stacks, and specialized images

optimized for specific workloads or applications. By choosing the right AMI, you can simplify the instance launch process

## **Task 1 - Create a Launch Template and Deploy Instances**

1. Go to the Amazon EC2 console in the AWS Management Console.
    
2. Navigate to "Launch Templates" in the left navigation pane and click on "Create launch template".
    
3. Provide a name and description for your launch template.
    
4. Under "Choose an Amazon Machine Image (AMI)", select "Amazon Linux 2023" as the AMI.
    
5. Scroll down to the "Instance type" section and choose "t2.micro" as the instance type.
    
6. In the "User data" section, enter the user data script that installs Jenkins and Docker (you can use the script from Day 39).
    
7. Configure other settings such as network, storage, security groups, and tags according to your requirements.
    
8. Click on "Create launch template".
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688137828054/65908077-0e00-4159-93c0-8f54779f0447.jpeg)
    

To create 3 instances using the launch template:

1. Go back to the Amazon EC2 console.
    
2. Navigate to "Instances" in the left navigation pane and click on "Launch instances" dropdown menu. Select "Launch instance from template"
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688137939145/1324fba3-0079-47bc-b556-ef15df396cff.jpeg)
    
3. Choose the launch template you created earlier from the list.
    
4. In the "Number of instances" field, specify "3" as the number of instances to be launched.
    
5. Review and configure other settings as needed.
    
6. Click on "Launch instances" to start the instances.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688137990875/c4a35b71-387b-47e2-9052-68788f014970.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688138172252/097b004f-6685-473b-baec-a3573419785d.jpeg)
    

## Task 2 - Create an auto-scaling group:

1. Go back to the Amazon EC2 console.
    
2. Navigate to "Auto Scaling Groups" in the left navigation pane and click on "Create Auto Scaling group".
    
3. Configure the basic settings for the auto-scaling group, such as the launch template, desired capacity, and minimum and maximum instances.
    
4. Set up scaling policies based on your requirements, such as scaling based on CPU utilization or other metrics.
    
5. Configure other advanced options such as health checks, notifications, and tags.
    
6. Review and confirm the settings.
    
7. Click on "Create Auto Scaling group" to create the auto-scaling group.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688140472567/b4f3b83b-e2d1-4098-9165-d7a26b29d926.jpeg)
    

Creating an auto-scaling group allows your instances to automatically scale based on the defined policies, ensuring that your infrastructure can handle varying workloads efficiently.

Now, let's run a stress test to ensure the Auto Scaling Group is working as expected:

1. Download and install the stress test tool:
    
    ```bash
    sudo amazon-linux-extras install epel -y
    sudo yum install stress -y
    ```
    
2. Launch the stress test in background (for 800 seconds in that example)
    
    ```bash
    sudo stress --cpu 8 --timeout 800 &
    ```
    
3. Check the stress test processes with the top command
    
    ```bash
    top
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688140914755/47ce24c1-1bf6-4484-b878-014ae72aab02.jpeg)
    
4. Once the instance CPU Utilization hits a value above the 50% threshold we've set up in the Auto Scaling Group, it will create a new instance. The maximum numbers of instances we can have is set up by the "Maximum Capacity" value in the ASG.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688142035964/35e5e986-20bd-4033-bbb0-5e3d7a527477.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688142088134/9d6b82a3-7c91-4d99-a89d-5cc6d1dbcba9.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688142096332/be86733b-0afe-4741-87c1-84c2f79e3207.jpeg)
    
5. We've just proved the ASG is working as expected and it will increase the capacity based on the CPU utilization.
    

Congratulations on completing Day 40 of the #90DaysOfDevOps Challenge. Today, we explored automation in AWS EC2, learned about launch templates, different instance types, and AMIs, empowering us to optimize our infrastructure and efficiently deploy applications. Stay tuned for Day 41, where we will learn how to set up an Application Load Balancer with AWS EC2.