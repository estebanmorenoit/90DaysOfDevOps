# #90DaysOfDevOps Challenge - Day 42 - IAM Programmatic access and AWS CLI

Welcome to Day 42 of the #90DaysOfDevOps challenge. Today, we will explore IAM programmatic access and the AWS Command Line Interface (CLI). These tools are essential for managing and interacting with your AWS resources efficiently. Let's dive in and learn how to leverage these powerful features.

## IAM Programmatic Access: Securely Manage Access to AWS Services

IAM (Identity and Access Management) is a powerful service in **AWS** that allows you to control access to your resources. IAM programmatic access enables you to manage access to **AWS services** securely using **access keys**. By leveraging access keys, you can automate tasks, integrate with other applications, and maintain fine-grained control over resource access.

## **AWS CLI**: Simplify AWS Service Management from the Command Line

The **AWS Command Line Interface (CLI)** is a versatile and comprehensive tool that empowers you to manage your **AWS services** directly from the command line. With **AWS CLI**, you can control multiple services, automate tasks, and seamlessly integrate **AWS operations** into your scripts and workflows. The latest version, **AWS CLI v2**, introduces numerous enhancements, including improved installers and additional configuration options, such as **AWS IAM Identity Center** (the successor to AWS SSO).

### Key Benefits of **AWS CLI**:

* **Streamlined Management**: With **AWS CLI**, you can perform a wide range of administrative tasks, such as creating and managing resources, configuring security settings, and monitoring service status, without leaving your command-line interface.
    
* **Automation and Scripting**: **AWS CLI** allows you to automate repetitive tasks, create scripts for complex workflows, and build customized solutions. This enables you to optimize your workflow and improve efficiency.
    
* **Seamless Integration**: Integrate **AWS CLI** commands into your existing scripts, workflows, and DevOps toolchains to orchestrate **AWS services** alongside your infrastructure and applications. This facilitates seamless collaboration and reduces manual effort.
    
* **Flexibility and Portability**: **AWS CLI** is platform-independent and runs on various operating systems, making it highly flexible and portable. Whether you're working on Linux, macOS, or Windows, you can harness the power of **AWS CLI** to manage your **AWS resources** consistently.
    

## AWS CLI Useful Commands

These commands are just a starting point, and there are many more AWS CLI commands available for various AWS services. You can explore the [AWS CLI documentation](https://docs.aws.amazon.com/cli/index.html) for a comprehensive list of commands and their usage.

`aws configure` - Set up your AWS CLI configuration by providing your access key, secret key, default region, and output format.

`aws s3 ls` - This command lists all the S3 buckets in your AWS account.

`aws s3 mb s3://bucket-name` - This command creates a new S3 bucket with the specified name.

`aws s3 rb s3://bucket-name` - This command deletes the specified S3 bucket.

`aws s3 cp file.txt s3://bucket-name` - This command uploads a file to an S3 bucket.

`aws s3 cp s3://bucket-name/file.txt .` - This command downloads a file from an S3 bucket to your local file system.

`aws s3 sync local-folder s3://bucket-name` - This command syncs the contents of a local folder with an S3 bucket.

`aws s3 ls s3://bucket-name` - This command lists the objects in an S3 bucket.

`aws s3 rm s3://bucket-name/file.txt` - This command deletes an object from an S3 bucket.

`aws s3 presign s3://bucket-name/file.txt` - This command generates a pre-signed URL for an S3 object, which can be used to grant temporary access to the object.

`aws s3api list-buckets` - This command retrieves a list of all S3 buckets in your AWS account, using the S3 API.

`aws ec2 describe-instances` - Retrieve information about your EC2 instances.

`aws lambda list-functions` - List all the Lambda functions in your AWS account.

`aws rds describe-db-instances` - Get details about your RDS database instances.

`aws cloudformation describe-stacks` - Retrieve information about your CloudFormation stacks.

`aws iam list-users` \- List all IAM users in your AWS account.

`aws sqs list-queues` - Get a list of your Amazon Simple Queue Service (SQS) queues.

`aws ecs list-services` - List all the services in your Amazon Elastic Container Service (ECS) cluster.

`aws eks describe-cluster` \- Get details about your Amazon Elastic Kubernetes Service (EKS) cluster.

## Task 1 - Create `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` from AWS Console

1. Log in to the AWS Management Console.
    
2. Open the IAM service.
    
3. Navigate to the "Users" section.
    
4. Select the user for whom you want to create access keys.
    
5. Open the "Security credentials" tab.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688237752683/1eaf57bb-c6fe-413e-a442-572de5c75aa0.jpeg)
    
6. Under the "Access keys" section, click on "Create access key". Use case "Command Line Interface (CLI)"
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688237913268/4825c59f-3cb3-4311-8374-f4f711b3f2f6.jpeg)
    
7. Take note of the generated `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. These will be needed later for configuration.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688237960524/3a2d815a-1f1d-4307-ae3b-5e868f1477cd.jpeg)
    

## Task 2 - Setup and Install AWS CLI and Configure Account Credentials

To get started with AWS CLI, follow these steps:

1. Install AWS CLI on your local machine. Refer to the [official AWS CLI documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) for installation instructions tailored to your operating system.
    
2. Once installed, open a terminal or command prompt.
    
3. Run the following command to configure AWS CLI:
    
    ```bash
    aws configure
    ```
    
4. When prompted, enter the AWS\_ACCESS\_KEY\_ID and AWS\_SECRET\_ACCESS\_KEY obtained in Task 1.
    
5. Specify your preferred region (e.g., `us-west-2`) and default output format (e.g., `YAML`).
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688238292630/bd090efe-183d-4707-b713-5ef2bbf7e198.jpeg)
    
6. AWS CLI is now configured with your account credentials. We can verify it's working as expected by checking the available instances in AWS.
    
    ```bash
    aws ec2 describe-instances
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688238892508/d876d8ab-3175-40f6-8a14-e956a9291a65.jpeg)
    

By completing these tasks, you have set up IAM programmatic access and the AWS CLI, enabling you to manage your AWS resources efficiently from the command line.

Congratulations on completing Day 42 of the #90DaysOfDevOps Challenge. Today, we dived into the world of IAM Programmatic Access and AWS CLI, exploring how to securely manage access to AWS services and simplify management from the command line. Tomorrow, we will explore S3 Programmatic Access with AWS CLI. Stay tuned!