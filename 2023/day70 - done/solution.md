# #90DaysOfDevOps Challenge - Day 70 - Terraform Modules

Welcome back to the #90DaysOfDevOps Challenge. On Day 70, we will be diving into Terraform modules, an essential concept in infrastructure-as-code (IAC) that allows us to encapsulate reusable pieces of infrastructure configurations.

## Terraform Modules

**Terraform modules** are **reusable packages** of Terraform configurations that can be used to **create multiple instances** of the same resource or a set of resources. They serve as **building blocks** to compose your infrastructure, making your Terraform code more **modular**, **maintainable**, and **scalable**.

* **Modules** are **containers** for **multiple resources** that are used together. **A module consists of** a collection of `.tf` and/or `.tf.json` files kept together in a **directory**.
    
* **A module can call other modules**, which lets you include the child module's resources in the configuration **concisely**.
    
* **Modules can also be called multiple times**, either within the same configuration or in separate configurations, allowing resource configurations to be **packaged** and **re-used**.
    

## Using Modules

To use a Terraform module effectively, follow these steps:

### Step 1: Create a Module

Before we can use a module, we need to create one! Let's consider an example where we want to set up an AWS S3 bucket with a predefined configuration. We'll create a module called "s3\_bucket" to encapsulate this resource.

First, we create a directory called "s3\_bucket" with the following file structure:

```bash
s3_bucket/
├── main.tf
└── variables.tf
```

In [`main.tf`](http://main.tf), we define the S3 bucket resource and configure it with input variables:

```bash
# s3_bucket/main.tf

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl
  tags   = var.tags
}
```

In [`variables.tf`](http://variables.tf), we declare the input variables for the module:

```bash
# s3_bucket/variables.tf

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Access control list for the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
}
```

Our module is now ready for use!

### Step 2: Implement the Root Configuration

Now, let's create a root configuration file that will use our "s3\_bucket" module to create an actual S3 bucket. In this example, we'll create a file named [`main.tf`](http://main.tf) for the root configuration:

```bash
# main.tf

provider "aws" {
  region = "us-west-2"
}

module "my_s3_bucket" {
  source      = "./s3_bucket"
  bucket_name = "my-awesome-bucket"
  acl         = "private"
  tags = {
    Environment = "Dev"
    Project     = "MyApp"
  }
}
```

In this root configuration, we specify the AWS provider and then call our "s3\_bucket" module using the `module` block. We pass the required values for the input variables `bucket_name`, `acl`, and `tags`.

Using modules in Terraform provides a way to organize and manage complex infrastructure while promoting reusability and maintaining a modular design. It allows teams to build infrastructure components once and share them across projects, leading to more efficient infrastructure management.

## Difference between Root Module and Child Module

In Terraform, the **Root Module** refers to the main configuration file that is executed by Terraform. This file typically contains the code that defines the overall infrastructure and serves as the entry point for Terraform to execute the configuration. The root module can call other child modules and pass values to them as arguments.

On the other hand, a **Child Module** is a separate directory containing Terraform configuration files that define a specific piece of infrastructure. Child modules can be reusable and are typically called by the root module or other child modules. They help in organizing the Terraform codebase and promoting code reusability.

To summarize, the root module is the starting point of execution, while child modules are self-contained configurations that can be called and reused by the root module.

## Modules and Namespaces

No, **modules** and **namespaces** are not the same in Terraform.

**Modules** (as discussed above) are a way to organize and package Terraform configuration files. They allow you to encapsulate infrastructure resources into reusable components. Modules help in achieving a modular design and simplifying the infrastructure code.

**Namespaces**, on the other hand, are a concept used in programming and computer systems to distinguish between different sets of identifiers, such as variables, functions, or resources, and avoid naming conflicts. In Terraform, namespaces are essential for maintaining unique names for resources and variables within a module or configuration.

**In summary:**

* Modules are used for code organization and reusability.
    
* Namespaces are used for maintaining unique identifiers within the code.
    

By leveraging modules, you can create a hierarchy of reusable components, each with its own input and output variables, to create a more structured and maintainable infrastructure codebase.

That's it for today's #90DaysOfDevOps Challenge. Stay tuned for Day 71, where we'll review some useful Terraform interview Questions!