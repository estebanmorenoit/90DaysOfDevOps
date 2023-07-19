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