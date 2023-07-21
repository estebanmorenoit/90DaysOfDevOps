# #90DaysOfDevOps Challenge - Day 68 - Scaling with Terraform

Welcome to Day 68 of the #90DaysOfDevOps Challenge. Today, we will explore the concept of scaling and learn how to scale your infrastructure dynamically using Terraform. Let's get started!

## Understanding Scaling

Scaling is the process of adding or removing resources to match the changing demands of your application. As your application grows, you will need to add more resources to handle the increased load. And as the load decreases, you can remove the extra resources to save costs.

Terraform makes it easy to scale your infrastructure by providing a declarative way to define your resources. You can define the number of resources you need and Terraform will automatically create or destroy the resources as needed.

## Task 1: Create an Auto Scaling Group

To create an Auto Scaling Group, follow these steps:

1. Update your [`main.tf`](http://main.tf) file with the provided code to define an Auto Scaling Group and launch configuration. We will use the rest of the resources created in previous articles to build the whole infrastructure including VPC, Subnets, Security Group, etc.
    
    ```bash
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "5.8.0"
        }
      }
    }
    
    provider "aws" {
      region = "eu-west-2"
    }
    
    resource "aws_vpc" "devopschallenge_vpc" {
      cidr_block = "10.0.0.0/16"
    
      tags = {
        Name = "devopschallenge_vpc"
      }
    }
    
    resource "aws_subnet" "devopschallenge_public_subnet" {
      vpc_id     = aws_vpc.devopschallenge_vpc.id
      cidr_block = "10.0.1.0/24"
    
      tags = {
        Name = "devopschallenge_public_subnet"
      }
    }
    
    resource "aws_subnet" "devopschallenge_private_subnet" {
      vpc_id     = aws_vpc.devopschallenge_vpc.id
      cidr_block = "10.0.2.0/24"
    
      tags = {
        Name = "devopschallenge_private_subnet"
      }
    }
    
    resource "aws_internet_gateway" "devopschallenge_igw" {
      vpc_id = aws_vpc.devopschallenge_vpc.id
    
      tags = {
        Name = "devopschallenge_igw"
      }
    }
    
    resource "aws_route_table" "devopschallenge_routetable" {
      vpc_id = aws_vpc.devopschallenge_vpc.id
    
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.devopschallenge_igw.id
      }
    
      tags = {
        Name = "devopschallenge_routetable"
      }
    }
    
    resource "aws_route_table_association" "public_subnet_association" {
      subnet_id      = aws_subnet.devopschallenge_public_subnet.id
      route_table_id = aws_route_table.devopschallenge_routetable.id
    }
    
    resource "aws_security_group" "devopschallenge_sg" {
      name_prefix = "devopschallenge_sg"
      vpc_id      = aws_vpc.devopschallenge_vpc.id
    
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
    
    resource "aws_launch_configuration" "web_server_asg" {
      name_prefix      = "web-server-asg"
      image_id         = "ami-0eb260c4d5475b901"
      instance_type    = "t2.micro"
      security_groups  = [aws_security_group.devopschallenge_sg.id]
      associate_public_ip_address = true
    
      user_data = <<-EOF
                    #!/bin/bash
                    sudo apt update
                    sudo apt install -y apache2
                    sudo systemctl start apache2
                    sudo systemctl enable apache2
                    echo "<html><body><h1>Welcome to my website!</h1></body></html>" > /var/www/html/index.html
                    sudo systemctl restart apache2
                    EOF
    }
    
    resource "aws_autoscaling_group" "web_server_asg" {
      name                 = "web-server-asg"
      launch_configuration = aws_launch_configuration.web_server_asg.name
      min_size             = 1
      max_size             = 3
      desired_capacity     = 2
      health_check_type    = "EC2"
      vpc_zone_identifier  = [aws_subnet.devopschallenge_public_subnet.id]
    }
    ```
    
2. Run `terraform init`, `terraform plan` and `terraform apply` to create the Auto Scaling Group.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689961924653/8be5969a-6270-4303-bda6-5e5a22db3b83.jpeg align="center")
    
3. Verify the EC2 instances have been successfully created.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962073993/6c1315bd-1a14-442f-9269-82274cffdeb4.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962458380/742c0d4b-1e69-4325-bf09-a17fa888e7f1.jpeg align="center")
    

## Task 2: Test Scaling

To test the scaling functionality, follow these steps:

1. Access the AWS Management Console and navigate to the Auto Scaling Groups service.
    
2. Select the Auto Scaling Group you created and click on the "Edit" button.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962200837/9069bd4a-b1e6-4359-9a3a-f9f848034934.jpeg align="center")
    
3. Increase the "Desired Capacity" to 3 and save the changes.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962223269/e7c8e0be-e561-40e8-9bd4-e1f60ebcd4f6.jpeg align="center")
    
4. Wait for a few minutes for the new instances to be launched.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962248223/a3be0229-3900-462f-b181-a59a079398c9.jpeg align="center")
    
5. Verify the launch of new instances in the EC2 Instances service.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962480351/ed28a5b9-b84b-4123-b06b-9686238306ba.jpeg align="center")
    
6. Decrease the "Desired Capacity" to 1 and wait for the extra instances to be terminated.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962536989/80f30fe9-4b18-4975-b3e0-c442cea69a95.jpeg align="center")
    
7. Confirm the termination of extra instances in the EC2 Instances service.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689962531916/dce5e5da-654f-4a0e-a9a3-f71b63f14e78.jpeg align="center")
    

By following these steps, you can observe how the Auto Scaling Group dynamically adjusts the number of instances based on the desired capacity, ensuring optimal resource allocation.

Congratulations on completing Day 68 of the #90DaysOfDevOps Challenge! Today, we explored scaling infrastructure using Terraform and Auto Scaling Groups in AWS. Scaling is a crucial aspect of modern infrastructure management, allowing you to respond to varying workloads effectively. Stay tuned for Day 69, where we'll dive into Meta-Arguments in Terraform.