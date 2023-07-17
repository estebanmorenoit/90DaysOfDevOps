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