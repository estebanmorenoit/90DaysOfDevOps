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