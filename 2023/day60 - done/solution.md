# #90DaysOfDevOps Challenge - Day 60 - Terraform

Welcome to Day 60 of the #90DaysOfDevOps Challenge. Today, we will dive into the fascinating world of Terraform and explore its capabilities in infrastructure provisioning. So, let's get started with Terraform!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689437937601/326a3f3a-631d-4fe6-99f2-f904008be303.png align="center")

## What is Terraform?

HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

## How does Terraform work?

Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). Providers enable Terraform to work with virtually any platform or service with an accessible API.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689438286202/e2a2bfd1-208e-400a-91d4-c5a4cfca9458.avif align="center")

HashiCorp and the Terraform community have already written **thousands of providers** to manage many different types of resources and services. You can find all publicly available providers on the [Terraform Registry](https://registry.terraform.io/), including Amazon Web Services (AWS), Azure, Google Cloud Platform (GCP), Kubernetes, Helm, GitHub, Splunk, DataDog, and many more.

The core Terraform workflow consists of three stages:

* **Write:** You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.
    
* **Plan:** Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.
    
* **Apply:** On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689438320812/4cc5fd45-4182-464b-9482-67dc229e0136.avif align="center")

## Task 1: Install Terraform

To begin our Terraform journey, let's install Terraform on your system. Follow the instructions in [this link](https://www.terraform.io/downloads.html) to install Terraform based on your operating system.

In my case, I will use the macOS instructions via homebrew:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Task 2: Answering Important Questions

Now, let's answer some key questions to deepen our understanding of Terraform:

1. ### Why do we use Terraform?
    
    Terraform provides a consistent and efficient way to manage infrastructure. It enables infrastructure automation, version control, and reproducibility, resulting in faster and more reliable deployments.
    
2. ### What is Infrastructure as Code (IaC)?
    
    Infrastructure as Code is the practice of managing and provisioning infrastructure resources using machine-readable definition files. It allows infrastructure to be treated as code, enabling automation, collaboration, and scalability.
    
3. ### What is a Resource?
    
    In Terraform, a resource refers to any component of your infrastructure that you can manage, such as virtual machines, networks, storage, or databases. Resources are defined in Terraform configuration files and can be provisioned, updated, or destroyed.
    
4. ### What is a Provider?
    
    A Provider in Terraform is responsible for managing and interacting with a specific cloud or infrastructure platform. Providers define the resources that can be provisioned and the operations that can be performed on those resources.
    
5. ### What is a State file in Terraform?
    
    Why is it important? The State file in Terraform keeps track of the current state of your infrastructure. It stores information about the resources Terraform manages, such as their configuration, metadata, and dependencies. The State file is crucial for understanding the desired state and making changes without disrupting existing resources.
    
6. ### What is Desired and Current State?
    
    The Desired State is the configuration defined in your Terraform files, specifying how you want your infrastructure to look. The Current State is the actual state of your infrastructure as tracked by Terraform. Terraform continuously reconciles the Current State with the Desired State, making necessary changes to align them.
    

In conclusion, Terraform empowers you to automate infrastructure provisioning and management, ensuring consistency and reproducibility. By using Infrastructure as Code, you can version control your infrastructure, collaborate with team members, and efficiently scale your deployments.

Stay tuned for Day 61 of the #90DaysOfDevOps Challenge, where we will continue our exploration of Terraform and its basic commands.