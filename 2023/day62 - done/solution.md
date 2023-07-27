# #90DaysOfDevOps Challenge - Day 62 - Terraform and Docker

Welcome to Day 62 of the #90DaysOfDevOps Challenge. Today, we dive into the powerful combination of Terraform and Docker. We'll explore blocks and resources in Terraform, and learn how to integrate Docker into our infrastructure automation.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689451063617/ec67f903-020a-4685-8cb0-d9f98e15cca8.webp)

## Blocks and Resources in Terraform

### Terraform Block

The `terraform` block in Terraform is used to configure the global settings and required providers for the Terraform configuration. It allows you to define the version constraints for the providers you're using in your infrastructure. In our case, we will define the **Docker provider** and specify its version to ensure compatibility with our Terraform code.

**Example:**

```bash
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}
```

### Provider Block

The `provider` block is used to configure the specific provider that Terraform will use to manage the resources. It specifies the details of the provider, such as its name, source, and any required authentication or configuration settings. In our case, we will configure the **Docker provider** using the kreuzwerker/docker registry as the source.

**Example:**

```bash
provider "docker" {
  host     = "tcp://<DOCKER_HOST>:<DOCKER_PORT>"
  registry = "registry.terraform.io/kreuzwerker/docker"
}
```

### Resource

A `resource` block represents a single infrastructure component that you want to manage with Terraform. It defines the desired state of that resource and specifies the configuration parameters required to create or manage it. In the context of our Terraform and Docker integration, we will create resource blocks for **Docker images and containers**. The resource block for the Docker image will define the image name and other related attributes, while the resource block for the Docker container will define the container's image, name, and any additional configuration like port mappings.

**Example - Docker Image:**

```bash
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
```

**Example - Docker Container:**

```bash
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 80
  }
}
```

By using **blocks** and **resources** in Terraform, you can define and manage your infrastructure components in a declarative manner. This allows for consistent and reproducible deployments, making it easier to maintain and scale your infrastructure as your needs evolve.

## Task 1: Creating Provider block and resource

### Terraform block

1. Start by creating a new Terraform script `docker_terraform.tf`
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689505661657/1bbcdd06-f3a8-4054-ade9-6eefc4421bfe.jpeg)
    
2. Define the `terraform` block and specify the required providers. Use `kreuzwerker/docker` as the Docker provider.
    
    ```yaml
    terraform {
      required_providers {
        docker = {
          source  = "kreuzwerker/docker"
          version = "~> 2.21.0"
        }
      }
    }
    ```
    
3. Save the file with a `.tf` extension.
    

### Provider block

1. Add the below provider block to the docker\_terraform.tf file
    
    ```bash
    provider "docker" {}
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507689488/28ea9e1e-a328-48ea-9463-124215de6a8c.jpeg)
    

## Task 2: Creating Resource Blocks for Nginx Docker Image and Container

1. Add the following code to create a resource block for the nginx Docker image:
    
    ```yaml
    resource "docker_image" "nginx" {
      name         = "nginx:latest"
      keep_locally = false
    }
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507723037/8ad1da80-0ef3-4383-9465-3d49263dc5d4.jpeg)
    
2. Add the following code to create a resource block for running a Docker container for nginx:
    
    ```yaml
    resource "docker_container" "nginx" {
      image = docker_image.nginx.latest
      name  = "tutorial"
      ports {
        internal = 80
        external = 80
      }
    }
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507745591/a64142ba-abd0-4a26-8c07-ba3d19665619.jpeg)
    
    Note: If Docker is not installed on your system, run the following commands to install it:
    
    ```bash
    sudo apt-get install docker.io
    sudo usermod -aG docker $USER
    sudo reboot
    docker ps
    ```
    
3. Now, we have our terraform file ready. Let's execute it.
    
4. Initialize the Terraform configuration:
    
    ```bash
      terraform init
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689506960336/77ecaf85-682e-49db-ae60-c4894b3d6ff9.jpeg)
    
5. Review the execution plan of changes:
    
    ```bash
      terraform plan
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507799997/cf1b5406-a7d5-4e0a-be8c-ac4f19a2836a.jpeg)
    
6. Apply the changes to the infrastructure:
    
    ```bash
      terraform apply
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507864303/6e6fbde0-d7e1-4797-9da7-656bd8b85096.jpeg)
    
7. Once the Docker container for the Nginx image is created, access the public URL to view the Nginx default webpage.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507930550/ab0450c2-bad0-49dd-b230-2a5cc4c0a064.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689507958122/244a0339-47f3-49ae-9fb0-e2068cd16d9a.jpeg)
    
8. We can use the terraform destroy command to delete the infrastructure created
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689508126429/8daa47d1-68cc-4ae2-930c-f1881f563d70.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689508176559/5b7b43da-cdbf-42bb-b36d-cd6b2781560e.jpeg)
    

Congratulations! You've learned how to use Terraform and Docker together. With Terraform, you can define and manage Docker resources, enabling you to build scalable and reproducible infrastructure. Stay tuned for day 63 of the #90daysofdevops challenge, where we'll dive into Terraform variables.