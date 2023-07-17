# #90DaysOfDevOps Challenge - Day 64 - Terraform with AWS

Welcome to Day 64 of the #90DaysOfDevOps Challenge! In today's challenge, we will explore Terraform with AWS and learn how to provision AWS resources using Terraform. Let's dive in!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689536203021/ffe06d81-792f-43fc-b07c-3a9663d2e397.webp align="center")

## Terraform with AWS

Terraform is a powerful infrastructure as code (IaC) tool that allows you to provision and manage cloud resources in a declarative manner. When combined with AWS (Amazon Web Services), Terraform becomes even more powerful, enabling you to create, modify, and destroy AWS resources using code.

Working with Terraform and AWS involves a few key steps:

### Install AWS CLI

The AWS CLI is a command-line interface that allows you to interact with various AWS services. Install the AWS CLI on your machine and configure it with your AWS credentials.

```bash
$ aws configure
```

### Set Up IAM User

In order to connect Terraform with your AWS account, you'll need an IAM user. IAM (Identity Access Management) allows you to manage access to your AWS resources securely. Create an IAM user and export the access keys and secret access keys to your machine.

```bash
export AWS_ACCESS_KEY_ID=<access-key>
export AWS_SECRET_ACCESS_KEY=<secret-access-key>
```

### Configure Terraform

In your Terraform configuration, specify the required providers and their versions. For AWS, you'll need to add the aws provider with the desired version. This ensures that Terraform can communicate with AWS and provision the necessary resources.

```bash
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}
```

### Specify AWS Region

Set the AWS region where you want to create your resources. This is important as it determines the geographic location of your resources. Specify the region in your Terraform configuration using the `region` attribute in the `provider` block.

```bash
provider "aws" {
  region = "eu-west-2"
}
```

### Define Resources

Use Terraform's resource blocks to define the AWS resources you want to provision. Specify the resource type, desired attributes, and any necessary configurations. For example, you can create EC2 instances, S3 buckets, IAM roles, and more.

```bash
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

### Apply Changes

Run `terraform init` to initialize the Terraform configuration and download the necessary provider plugins. Then, run `terraform plan` to see an execution plan of the changes Terraform will make. Finally, run `terraform apply` to apply the changes and provision the AWS resources.

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

By leveraging Terraform with AWS, you gain the ability to manage your infrastructure as code, enabling version control, automation, and repeatability. You can easily scale your infrastructure, maintain consistency, and collaborate effectively with teams.

Remember to follow AWS best practices and consider factors such as security, scalability, and cost optimization while working with Terraform and AWS.

## Task 1: Provision an AWS EC2 Instance using Terraform

Now, let's provision an AWS EC2 instance using Terraform.

1. Open your preferred text editor and create a new file named [`main.tf`](http://main.tf).
    
2. Copy the following code into the [`main.tf`](http://main.tf) file:
    
    ```bash
    terraform {
      required_providers {
        aws = {
          source = "hashicorp/aws"
          version = "5.8.0"
        }
      }
    }
    
    provider "aws" {
      region = "eu-west-2"
    }
    
    resource "aws_instance" "aws_ec2_test" {
      count         = 1
      ami           = "ami-0eb260c4d5475b901"
      instance_type = "t2.micro"
      subnet_id = "subnet-03ff724100ea66d8a	"
    
      tags = {
        Name = "TerraformTestServerInstance"
      }
    }
    ```
    
3. Save the [`main.tf`](http://main.tf) file.
    
4. Open a terminal or command prompt and navigate to the directory where you saved the [`main.tf`](http://main.tf) file.
    
5. Run the following command to initialize the Terraform configuration:
    
    ```bash
    terraform init
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689617642578/e1078cc4-4d4e-4be9-880f-e868734be819.jpeg align="center")
    
6. After the initialization is complete, run the following command to see an execution plan of the changes Terraform will make:
    
    ```bash
    terraform plan
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689618826319/ec58ec83-34a4-42f3-8958-c9ec1ad1ea9f.jpeg align="center")
    
7. Review the plan to ensure that it aligns with your expectations.
    
8. Finally, apply the changes and provision the EC2 instances by running the following command:
    
    ```bash
    terraform apply
    ```
    
9. When prompted to confirm the changes, type `yes` and press Enter.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689618912955/39503508-1859-4b2e-8441-c81955069daa.jpeg align="center")
    
10. Let's verify in the AWS EC2 menu.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689618961062/476f93a5-23a3-40c9-ba34-45793e2bd015.jpeg align="center")
    

Terraform will now provision four EC2 instances based on the specified configuration. You can monitor the progress in the terminal as Terraform creates the resources.

Congratulations! You have successfully provisioned AWS EC2 instances using Terraform. Stay tuned for Day 65 of the #90daysofdevops challenge, where we'll explore Terraform Resources.