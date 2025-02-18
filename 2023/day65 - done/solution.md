# #90DaysOfDevOps Challenge - Day 65 - Working with Terraform Resources

Welcome to Day 65 of the #90DaysOfDevOps Challenge! Today, we will explore how to work with Terraform resources, which are essential for provisioning and managing infrastructure. Let's dive in!

## Understanding Terraform Resources

A **resource** in Terraform represents a component of your infrastructure, such as a physical server, a virtual machine, a DNS record, or an S3 bucket. Resources have **attributes** that define their properties and behaviours, such as the size and location of a virtual machine or the domain name of a DNS record.

When you define a resource in Terraform, you specify the **type** of resource, a unique **name** for the resource, and the attributes that define the resource. Terraform uses the **resource block** to define resources in your Terraform configuration.

Here's an example of a resource block defining an AWS EC2 instance:

```bash
resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name      = "my-keypair"

  tags = {
    Name = "example-instance"
  }
}
```

In this example, we define an AWS EC2 instance resource with the AMI ID, instance type, key pair name, and a tag for identifying the instance. This resource block tells Terraform to create and manage the specified EC2 instance in your infrastructure.

## Task 1: Create a Security Group

To allow traffic to your EC2 instance, you need to create a security group. Here's how:

1. Open your [`main.tf`](http://main.tf) file and add the following code to create a security group:
    

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

resource "aws_security_group" "web_server" {
  name_prefix = "web-server-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
```

1. Run `terraform init` to initialize the Terraform project.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689703973363/16e1d8e9-6b75-4545-a1cc-125f011618e3.jpeg)
    
2. Run `terraform plan` to see an execution plan of the changes that Terraform will make to your infrastructure
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689787464907/a08b67bd-aeaf-4133-9637-11287253da54.jpeg)
    
3. Run `terraform apply` to create the security group.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689787496278/493b0e65-7b7d-4d01-a430-daaf58f6274d.jpeg)
    
4. We can verify the Security Group has been successfully created in our AWS account.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689787529137/2cb58cd7-e318-4d86-9c30-921813875bd6.jpeg)
    

## Task 2: Create an EC2 Instance

Now, let's provision an EC2 instance using Terraform. Follow these steps:

1. In your [`main.tf`](http://main.tf) file, add the following code to create an EC2 instance:
    
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
    
    resource "aws_security_group" "web_server" {
      name_prefix = "web-server-sg"
    
      ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    
      egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    
    }
    
    resource "aws_instance" "web_server" {
      ami           = "ami-0eb260c4d5475b901"
      instance_type = "t2.micro"
      key_name      = "devopschallenge-key"
      subnet_id     = "subnet-03ff724100ea66d8a"
      security_groups = [
        aws_security_group.web_server.id
      ]
      associate_public_ip_address = true
    
      user_data = <<-EOF
                    #!/bin/bash
                    sudo apt update
                    sudo apt install -y apache2
                    sudo systemctl start apache2
                    sudo systemctl enable apache2
                    echo "<html><body><h1>Welcome to my website!</h1></body></html>" > /var/www/html/index.html
                    EOF
    }
    ```
    
    Note: Replace the `ami` and `key_name` values with your own. You can find a list of available AMIs in the AWS documentation.
    
2. Run `terraform plan` and`terraform apply` to create the EC2 instance using the Security Group created above.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689765588904/2f8853c3-c4cd-4182-89e4-74a736a77ef1.jpeg)
    

## Task 3: Access Your Website

Now that your EC2 instance is up and running, you can access the website you just hosted on it. Follow these steps:

1. Obtain the public IP address of your EC2 instance either from the Terraform output or the AWS Management Console.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689765553936/72d685bb-5bbd-475f-a462-c45b61aa873b.jpeg)
    
2. Open a web browser and enter the public IP address. You should see the message "Welcome to my website!" displayed.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689765525291/f77f177c-bd96-4291-afa2-32287388e738.jpeg)
    

Congratulations! You have successfully created a security group, provisioned an EC2 instance, and hosted a website using Terraform. Stay tuned for Day 66 of the #90daysofdevops challenge, where we'll work on a new Terraform Hands-on Project.