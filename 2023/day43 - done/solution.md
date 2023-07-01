# #90DaysOfDevOps Challenge - Day 43 - S3 Programmatic access with AWS-CLI

Welcome to Day 43 of the #90DaysOfDevOps Challenge! In today's session, we will explore S3 (Simple Storage Service) and learn how to leverage its powerful features using the AWS Command Line Interface (AWS CLI). S3 is a highly scalable and durable object storage service provided by AWS, offering secure storage for various types of data.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688242305149/03b26f27-8155-4d60-b79d-23a1c125181d.png align="center")

## Amazon S3 - Simple Cloud Storage

Amazon S3, or Simple Storage Service, is a fully managed storage service offered by AWS. It provides developers and businesses with secure, scalable, and durable object storage in the cloud. With Amazon S3, you can store and retrieve any amount of data from anywhere on the web, making it ideal for a wide range of applications such as backup and restore, data archiving, content storage and distribution, and big data analytics.

One of the key features of Amazon S3 is its scalability. It allows you to scale your storage resources up or down based on your requirements, ensuring that you have the necessary capacity to handle any workload. Additionally, Amazon S3 provides high durability, ensuring that your data is protected against hardware failures and errors. It automatically replicates your data across multiple facilities and provides built-in redundancy to ensure data integrity.

Another advantage of Amazon S3 is its security features. It offers fine-grained access control to your data, allowing you to define access policies and permissions at the bucket and object level. You can also encrypt your data at rest and in transit using industry-standard encryption protocols to ensure the confidentiality and integrity of your data.

With its simple and intuitive API, Amazon S3 enables seamless integration with other AWS services, making it a versatile storage solution for building scalable and reliable applications. Whether you're a small startup or a large enterprise, Amazon S3 provides the flexibility and reliability you need to store and retrieve your data efficiently.

In summary, Amazon S3 is a robust and highly scalable cloud storage service that offers durability, security, and ease of use. It provides developers and businesses with a reliable and cost-effective solution for storing and managing their data in the cloud.

## Overview of S3 Features

S3 offers a wide range of features that make it a versatile storage solution for your applications. Some of the key features of S3 include:

1. **Scalability:** S3 provides virtually unlimited storage capacity, allowing you to scale your storage needs as your data grows.
    
2. **Durability and Availability:** S3 stores data across multiple availability zones, ensuring the high durability and availability of your objects.
    
3. **Security and Access Control:** S3 offers robust security mechanisms, including access control policies, bucket policies, and encryption options, to protect your data.
    
4. **Lifecycle Management:** You can define lifecycle policies to automatically transition objects between storage classes based on their age or other criteria.
    
5. **Versioning:** S3 supports versioning, allowing you to store multiple versions of an object and easily restore previous versions if needed.
    
6. **Event Notifications:** S3 can trigger events, such as object creation or deletion, which can be used to automate workflows or trigger other AWS services.
    

## Task 1 - Uploading and Accessing Files

1. Launch an EC2 instance through the AWS Management Console:
    
    * Navigate to the EC2 service.
        
    * Click on "Launch Instances" and follow the prompts to select the desired instance type, configure security settings, and launch the instance.
        
    * Note down the instance's public IP or DNS name.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688240632409/cb1e6bad-9811-4ab2-ac43-cf2fcb7bc828.jpeg align="center")
        
2. Connect to the EC2 instance using Secure Shell (SSH):
    
    * Open a terminal or SSH client.
        
    * Use the SSH command with the EC2 instance's public IP or DNS name, along with the appropriate SSH key.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688240428367/d330e294-00f3-4337-9a50-9e3966b0afdf.jpeg align="center")
        
    * Follow the above instructions and verify the SSH connection
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688240474329/128618f3-ea8d-4f28-bfd4-9732ffc21edc.jpeg align="center")
        
3. Create an S3 bucket and upload a file:
    
    * Go to the S3 service in the AWS Management Console.
        
    * Click on "Create Bucket" and follow the prompts to configure the bucket settings.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688240604402/cabab7ee-2e37-4df3-bb5b-193d279e5697.jpeg align="center")
        
    * Upload a file by clicking on the bucket name, selecting "Upload," and choosing the desired file.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688240751162/7a615456-f2c5-41d0-9ab1-14bfff86973a.jpeg align="center")
        
4. Access the uploaded file from the EC2 instance using the AWS CLI:
    
    * Install the AWS CLI on the EC2 instance if it's not already installed.
        
    * Use the AWS CLI command aws s3 cp s3://bucket-name/file-name local-file-name to download the file from the S3 bucket.
        
        ```bash
        aws s3 cp s3://devopschallenge-day43/devopschallenge-testfile.txt devopschallenge-testfile-localcopy.txt
        ```
        
    * Verify the contents of the downloaded file.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688240977531/8a775d7d-a4a6-4afa-957c-e10ecaa263c1.jpeg align="center")
        

## Task 2 - Snapshot and Verification

1. Create a snapshot of the EC2 instance:
    
    * Go to the EC2 service in the AWS Management Console. Select 'Elastic Block Store' and click on 'Snapshots'
        
    * Select the 'Create snapshot' button.
        
    * Follow the prompts to create the snapshot.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688241266538/f6dce89d-135f-4c4a-889f-d02c7b19420c.jpeg align="center")
        
2. Use the created snapshot to launch a new EC2 instance:
    
    * Select the created snapshot, go to 'Actions' and click on "Create image from snapshot"
        
    * Follow the prompts and configure the image.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688241487503/9dcceeed-e6e2-4906-a13f-0fe8765f7f31.jpeg align="center")
        
    * Navigate to the AMIs section in the EC2 dashboard to find the newly created image. Right-click on it and select 'Launch instance from AMI'
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688241644469/ed0de741-feb3-4086-af97-4fde0d6dc199.jpeg align="center")
        
3. To ensure the consistency of the file across both EC2 instances, follow these steps for verification:
    
    * Connect to the new EC2 instance using SSH.
        
    * Locate the directory where we downloaded the file earlier in the article and use the cat command to show the content
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688242225559/dd13676d-b2b1-4626-9265-9daaac85fff5.jpeg align="center")
        
    * Let's compare it with the content of the file in the first instance we created earlier:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688242234347/eddcd30d-cd61-4262-96b8-694a916f5048.jpeg align="center")
        

Congratulations on completing Day 43 of the #90DaysOfDevOps Challenge. Today, we explored S3 Programmatic Access with AWS CLI, learning how to interact with S3 buckets and perform file operations from the command line. Tomorrow, get ready for a new topic as we dive into Relational Database Service (RDS) in AWS. Stay tuned for Day 44!