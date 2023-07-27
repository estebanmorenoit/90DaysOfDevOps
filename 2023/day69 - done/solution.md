# #90DaysOfDevOps Challenge - Day 69 - Meta-Arguments in Terraform

Welcome back to Day 69 of the #90DaysOfDevOps challenge. In this article, we'll dive into the world of meta-arguments in Terraform, specifically focusing on `count` and `for_each`. These powerful meta-arguments allow us to manage multiple instances of resources and modules in an efficient and scalable manner.

## Meta-Arguments in Terraform

Meta-arguments in Terraform are special configuration options that provide dynamic and flexible behaviour when defining resources or modules. They enable us to create, modify, and manage multiple instances of resources based on various conditions or inputs.

### The `count` Meta-Argument

The `count` meta-argument allows us to create multiple instances of a resource based on a specified whole number. Each instance gets its own distinct infrastructure object, enabling individual management of each resource.

Let's see an example of how we can use the `count` meta-argument:

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  count = 4

  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index + 1}"
  }
}
```

In this example, we are creating four instances of an AWS EC2 instance, and each instance is tagged with a unique name using the `count.index` variable.

### The `for_each` Meta-Argument

The `for_each` meta-argument is similar to the `count` argument, but instead of using a whole number, it accepts a map or set of strings. This is useful when we need to create multiple resources with different values, such as different AMI IDs or different tags for each resource.

Let's explore the `for_each` meta-argument with an example:

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

locals {
  ami_ids = toset([
    "ami-0b0dcb5067f052a63",
    "ami-08c40ec9ead489470",
  ])
}

resource "aws_instance" "server" {
  for_each = local.ami_ids

  ami           = each.key
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${each.key}"
  }
}
```

In this example, we are creating two instances of an AWS EC2 instance, each with a different AMI ID. The `local.ami_ids` map defines the AMI IDs and the `each.key` represents the key (AMI ID) of each iteration.

### The `depends_on` Meta-Argument

The `depends_on` meta-argument allows us to define explicit dependencies between resources. This ensures that a resource is created or modified only after the specified resource(s) have been successfully created.

```bash
resource "aws_s3_bucket" "logs" {
  bucket = "my-logs-bucket"
}

resource "aws_cloudfront_distribution" "cdn" {
  # Configuration for CloudFront distribution

  depends_on = [aws_s3_bucket.logs]
}
```

### The `provider` Meta-Argument

The `provider` meta-argument allows us to specify a specific provider configuration for a resource or module. This is useful when working with multiple providers, such as different cloud providers, and we want to use a particular provider for a specific resource or module.

```bash
provider "aws" {
  region = "us-east-1"
}

provider "google" {
  credentials = file("path/to/google_credentials.json")
}

resource "aws_instance" "server" {
  # Configuration for AWS instance
}

resource "google_compute_instance" "gcp_server" {
  # Configuration for Google Cloud instance

  provider = google
}
```

## Task 1: Demonstrating the Use of `count` and `for_each`

To demonstrate the use of `count` and `for_each`, follow these steps:

Create a new Terraform configuration file and paste the respective code blocks provided in the examples above.

### count

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  count = 4

  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index + 1}"
  }
}
```

1. Run `terraform init` to initialize the working directory.
    
2. Run `terraform apply` to create the infrastructure as specified in the Terraform configuration.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690027261341/6de21f60-0494-43a2-a1bd-1d6b6fe9fbe6.jpeg)
    
3. Observe how multiple instances of AWS EC2 instances are created based on the value of `count`.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690027294046/d8939dcb-1636-4561-9abe-8a6538b7b21f.jpeg)
    

### for\_each

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

locals {
  ami_ids = toset([
    "ami-0b0dcb5067f052a63",
    "ami-08c40ec9ead489470",
  ])
}

resource "aws_instance" "server" {
  for_each = local.ami_ids

  ami           = each.key
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${each.key}"
  }
}
```

1. Run `terraform init` to initialize the working directory.
    
2. Run `terraform apply` to create the infrastructure as specified in the Terraform configuration.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690027830340/b9e43d8b-831e-4222-8364-098d34fe6800.jpeg)
    
3. Observe how multiple instances of AWS EC2 instances are created based on the value of `for_each`.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690028000859/b8f40620-5d8c-4205-ab13-3058d213f18a.jpeg)
    

Meta-arguments like `count` and `for_each` are essential tools in Terraform for managing multiple instances of resources and modules. They allow us to dynamically create and configure infrastructure based on our needs, making our infrastructure code more flexible and scalable.

Stay tuned for Day 70 of the #90DaysOfDevOps challenge, where we'll explore Terraform Modules!