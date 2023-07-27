# #90DaysOfDevOps Challenge - Day 63 - Terraform Variables

Welcome to Day 63 of the #90DaysOfDevOps Challenge. Today, we will explore Terraform variables and dive into different data types. Understanding variables is crucial for creating flexible and reusable Terraform configurations. So let's get started!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689534750085/b8cf869e-4dca-44be-845c-90b0dc8f44d3.png)

## Variables in Terraform

Variables in Terraform allow you to parameterize your configurations and make them more dynamic. They enable you to pass values into your Terraform code, making it easier to customize and reuse your infrastructure deployments. Terraform supports various data types for variables, including maps, lists, objects, and sets.

### Map

The Map data type in Terraform allows you to store key-value pairs, similar to a dictionary or hash table. It provides a way to represent structured data and enables you to organize and access information in a more structured manner.

**Example:**

```bash
variable "region_mappings" {
  type    = map
  default = {
    "us-east-1" = "N. Virginia"
    "us-west-2" = "Oregon"
    "eu-west-1" = "Ireland"
  }
}
```

### List

The List data type in Terraform allows you to define an ordered collection of values. It is useful when you need to represent a series of elements or multiple occurrences of a particular value.

**Example:**

```bash
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "m5.large", "r5.xlarge"]
}
```

### Object

The Object data type in Terraform allows you to define a complex data structure with multiple attributes. It is useful when you need to group related values under a single variable.

**Example:**

```bash
variable "server" {
  type = object({
    name     = string
    cpu      = number
    memory   = number
    disk     = bool
    os       = string
  })
  default = {
    name     = "web-server"
    cpu      = 4
    memory   = 8
    disk     = true
    os       = "Ubuntu 20.04"
  }
}
```

### Set

The Set data type in Terraform represents an unordered collection of unique values. It is useful when you need to ensure uniqueness and perform set-based operations on a collection of values.

**Example:**

```bash
variable "tags" {
  type    = set(string)
  default = ["production", "web", "app"]
}
```

Now that we have covered the basics of Terraform variables and data types, let's move on to the resolution of our tasks for today.

## Task 1: Creating a Local File

In this task, we will use Terraform to create a local file. Follow the steps below:

1. Create your Terraform configuration file `main.tf`.
    
2. Add the following code to define a local file resource:
    
    ```bash
    resource "local_file" "devops" {
      filename = var.filename
      content  = var.content
    }
    ```
    
    This resource will create a local file with the specified filename and content.
    
3. Define the input variables `filename` and `content` in your Terraform code or in a separate variables file called `variable.tf`
    
    ```bash
    variable "filename" {
        default = "/home/ubuntu/terraform/day63/task1.txt"
    }
    
    variable "content" {
        default = "This file has been created by Terraform for the Day 63 of the #90daysofdevops challenge"
    }
    ```
    
4. Save the changes and run `terraform init`. This initializes terraform in the folder. It installs all the plugins and providers required to run the Terraform file.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689589966430/7cd575b8-0d30-4792-83b4-ad163feee529.jpeg)
    
5. Run `terraform plan` to outline the required changes to achieve the planned infrastructure
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689590037713/5e7a81e8-889c-4835-afa8-9a72ef4de6c4.jpeg)
    
6. Run `terraform apply` to create the local file.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689590070915/278eb3df-5e3b-4fe7-b3a9-de0ee2d7ea45.jpeg)
    
    Terraform will execute the configuration and create the local file based on the provided variables.
    
7. Now, we can verify if the file has been created as defined in the `main.tf` and `variable.tf` files
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689590543233/32ab9199-f7ca-40ca-9457-3c3f80337269.jpeg)
    

## Task 2: Demonstrating Usage of List, Set, and Object Data Types

In this task, we will use Terraform to demonstrate the usage of list, set, and object data types. Follow these steps:

1. Create your Terraform configuration file and define variables that utilize different data types, such as lists, sets, and objects. I will use the below `variable.tf`:
    
    ```bash
    variable "filename_list" {
      type    = list(string)
      default = ["/home/ubuntu/terraform/day63/task2/list_task1.txt", "/home/ubuntu/terraform/day63//task2/list_task2.txt"]
    }
    
    variable "content_list" {
      type    = list(string)
      default = ["List item number 1", "List item number 2", "List item number 3"]
    }
    
    variable "servers_set" {
        type = set(string)
        default = ["Ubuntu", "Windows"]
    }
    
    variable "object_server" {
      type = object({
        name     = string
        cpu      = number
        memory   = number
        disk     = bool
        os       = string
      })
      default = {
        name     = "web-server"
        cpu      = 4
        memory   = 8
        disk     = true
        os       = "Ubuntu 20.04"
      }
    }
    ```
    

1. Add the necessary resources and configurations to your Terraform file to showcase the usage of these data types. This is my `main.tf` file:
    
    ```bash
    resource "local_file" "list_file1" {
        filename = var.filename_list[0]
        content = var.content_list[0]
    }
    
    resource "local_file" "list_file2" {
        filename = var.filename_list[1]
        content = var.content_list[2]
    }
    
    output "server_set_names" {
        value = var.servers_set
    }
    
    output "object_server_name" {
        value = var.object_server.name
    }
    ```
    
2. Save the changes to your Terraform configuration file.
    
3. Run `terraform init` command to initialize Terraform in the current directory. This command installs all the required plugins and providers needed to run the Terraform configuration.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689604100057/f20fe4a5-5dfa-43a7-9d02-e2ad7ecf2e59.jpeg)
    
4. Run `terraform plan` to see an execution plan of the changes that Terraform will make to your infrastructure based on the defined variables and resource configurations.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689604131327/6b75d9e2-c17e-4274-916f-e0455eddef4f.jpeg)
    
5. Run `terraform apply` to apply the changes and create the resources based on the defined variables and resource configurations.
    
6. Terraform will prompt for confirmation. Type "yes" and press Enter to proceed with the resource creation.
    
7. Once the resource creation is complete, Terraform will display the outputs of the applied changes, including any generated resources or updated configurations.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689604172637/ae59bbb5-d7ca-496e-88f3-f12d98674a51.jpeg)
    
8. Verify that the list, set, and object data types were utilized correctly by checking the provisioned resources and their attributes in your infrastructure.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689604375638/ea668ddf-3cf0-4fac-864b-f27e42509295.jpeg)
    

By following these steps, you have successfully demonstrated the usage of different data types in Terraform and refreshed the state to reflect the changes in your configuration.

In conclusion, Terraform variables and data types provide powerful capabilities for customizing and structuring your infrastructure deployments. By leveraging variables, you can create flexible and reusable configurations. Understanding the different data types in Terraform allows you to design and manage your infrastructure more effectively.

Remember to check out the [Official Terraform documentation](https://developer.hashicorp.com/terraform/language/values/variables) for more in-depth information on variables and data types.

Stay tuned for Day 64 of the #90daysofdevops challenge, where we'll learn how to use Terraform with AWS.