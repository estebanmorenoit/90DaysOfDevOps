# #90DaysOfDevOps Challenge - Day 54 - Understanding Infrastructure as Code and Configuration Management

Welcome to Day 54 of the #90DaysOfDevOps Challenge! In today's topic, we will explore the concepts of Infrastructure as Code (IaC) and Configuration Management. These practices play a crucial role in managing infrastructure and applications efficiently. So let's dive in!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688932583800/0884ac1b-b5c7-4e6b-afee-4ba2bb2acb6a.png align="center")

## What's the Difference between Infrastructure as Code and Configuration Management?

When it comes to the cloud, Infrastructure as Code (IaC) and Configuration Management (CM) are inseparable. With IaC, a descriptive model is used for infrastructure management. To name a few examples of infrastructure: networks, virtual computers, and load balancers. Using an IaC model always results in the same setting.

Throughout the lifecycle of a product, Configuration Management (CM) ensures that the performance, functional and physical inputs, requirements, design, and operations of that product remain consistent.

**Infrastructure as Code (IaC)** involves using code to define and manage infrastructure resources. It allows developers to automate the process of provisioning servers, configuring tools, and setting up environments. With IaC, manual management of servers, database connections, operating systems, and other infrastructure components becomes a thing of the past. Popular IaC tools include **AWS CloudFormation**, **Terraform**, and **Azure Resource Manager**.

**Configuration Management**, on the other hand, focuses on managing the configuration and state of software applications and systems. It ensures consistency in configuration settings, software packages, libraries, and dependencies across multiple environments. Configuration Management tools such as **Ansible**, **Puppet**, and **Chef** automate the deployment and configuration of applications, maintaining the desired state consistently.

Let's explore some key differences between IaC and Configuration Management with suitable examples:

1. **Scope**: IaC focuses on defining and automating the deployment of entire infrastructure stacks, while Configuration Management tools concentrate on individual servers and their configuration.
    
2. **Infrastructure Provisioning**: IaC tools are used to create new infrastructure from scratch, whereas Configuration Management tools are used to configure existing infrastructure.
    
3. **Resource Management**: IaC tools handle the lifecycle of resources like virtual machines, networks, and storage. Configuration Management tools, on the other hand, manage the configuration of software and services running on these resources.
    
4. **Deployment Strategy**: IaC tools typically follow a declarative approach, where the desired state of the infrastructure is defined in code. Configuration Management tools, on the other hand, use an imperative approach, employing scripts to perform specific actions on existing infrastructure.
    

## What are the Most Common IaC and Configuration Management Tools?

Here are some of the most widely used tools in the IaC and Configuration Management domains:

**Infrastructure as Code (IaC) Tools:**

* **Terraform**: A powerful open-source tool that allows you to define infrastructure as code using a high-level configuration language called HCL. It supports multiple cloud providers, including AWS, Azure, and Google Cloud Platform.
    
* **Pulumi**: An open-source tool that lets you define infrastructure as code using familiar programming languages like Python, TypeScript, and Go. It also supports multiple cloud providers.
    
* **AWS CloudFormation**: A service provided by AWS that enables you to define and deploy infrastructure resources in AWS using JSON or YAML templates. CloudFormation's templates can define a wide range of resources, including EC2 instances, S3 buckets, and VPCs.
    

**Configuration Management Tools:**

* **Ansible**: An open-source automation tool that simplifies configuration management, deployment, and orchestration. It uses a YAML-based language for defining infrastructure and configuration and can manage infrastructure on-premises or in the cloud.
    
* **Chef**: An open-source configuration management tool that uses a Ruby-based language to define and manage infrastructure configurations. It employs a client-server architecture, where the client runs on the managed nodes, and the server hosts the configuration data.
    
* **Puppet**: An open-source configuration management tool that uses a declarative language to define and manage infrastructure configurations. Like Chef, it follows a client-server architecture, with the client running on the managed nodes and the server hosting the configuration data.
    

Stay tuned for Day 55 of the #90DaysOfDevOps Challenge, where we will dive into a new topic: Understanding Configuration Management wit Ansible.