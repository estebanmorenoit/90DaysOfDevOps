# #90DaysOfDevOps Challenge - Day 55 - Understanding Configuration Management with Ansible

Welcome to Day 55 of the #90DaysOfDevOps Challenge. Today, we will dive into the world of configuration management with Ansible. Configuration management plays a crucial role in automating and managing the configuration of systems and applications, ensuring consistency and scalability in your infrastructure.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689191346801/3627be9e-7a3e-4bfd-b9f3-9a9796b831a6.jpeg)

## What is Ansible?

**Ansible** is a powerful open-source **automation tool** used for **managing** and **deploying software applications**, **system configurations**, and **infrastructure**. It simplifies complex IT environments by following a **declarative approach**, allowing users to define the desired state of their systems using a **simple** and **human-readable language**. With Ansible, tasks can be **automated**, complex workflows can be **orchestrated**, and system **consistency** can be ensured.

One of Ansible's standout features is its **agentless architecture**. It communicates with remote systems over **SSH** or **WinRM**, eliminating the need for agents to be installed on target systems. This approach simplifies management and enhances security by reducing software installations and potential attack vectors.

Ansible offers an extensive collection of **modules**, enabling automation across various systems and services such as **servers**, **databases**, **cloud platforms**, and **networking devices**. Users can also create **custom modules** to extend Ansible's functionality according to their specific requirements.

In addition to its automation capabilities, Ansible is known for its **idempotent nature**. Running Ansible playbooks multiple times produces the same result, regardless of the system's initial state. This ensures consistency and helps maintain the desired state across deployments.

Overall, Ansible provides a flexible and user-friendly solution for automating tasks, improving efficiency, and ensuring consistency in IT operations. With its **agentless architecture**, **extensive module library**, and **idempotent nature**, Ansible empowers organizations to streamline their management and deployment processes, reducing errors and enabling scalable infrastructure management.

## Task 1: Installation of Ansible on AWS EC2 (Master Node)

To get started with Ansible, we need to install it on our AWS EC2 instance, which will act as the master node. Follow these steps to install Ansible:

1. Connect to your AWS EC2 instance via SSH.
    
2. Run the following commands to add the Ansible repository, update the package lists, and install Ansible:
    

```shell
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689271461682/f2d7b764-b800-4c75-90e6-62d392bd7397.jpeg)

## Task 2: Understanding the Hosts File

The Ansible hosts file is used to define the inventory of target systems that Ansible will manage. To learn more about the `hosts` file and its structure, follow these steps:

1. Open the `hosts` file using the following command:
    

```shell
sudo nano /etc/ansible/hosts
```

1. Familiarize yourself with the format of the `hosts` file and understand how to define hosts and groups.
    
2. We can create 2 Ansible nodes by setting up 2 new EC2 instances. Once created, we can add them to the `hosts` file
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689330977754/5fc0b949-a6ff-4c29-bda7-334cc97e6eea.jpeg)
    
3. Use the following command to list the hosts and groups defined in the `hosts` file:
    

```shell
ansible-inventory --list -y
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689331007879/3a05955b-430b-4761-9cb2-15234d5ef7d0.jpeg)

## Task 3: Setting Up Additional EC2 Instances and Testing Ansible Connectivity

In this task, we will set up two more EC2 instances, similar to the previous instance acting as the node, and test the connectivity using Ansible. Follow these steps:

1. Use the two additional EC2 instances created before.
    
2. To establish secure communication, create a public key on the master server and copy it using the `ssh-keygen` command.
    
    ```bash
    ssh-keygen
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689273086348/dd4269cc-f48b-4707-a285-155025cae0dd.jpeg)
    
3. Copy the public key of the master server to the nodes. This can be found in the `id_rsa.pub` file.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689273148724/d5f338a5-1212-4b88-aef5-857b5ebea61e.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689273899099/5db72f07-36d0-4f61-ad31-083299cfccbd.jpeg)
    
    Now, we'll proceed to copy the above public key on the nodes. We'll use the below command to open the `authorized_keys file`. Do the same on both nodes.
    
    ```bash
    sudo nano /home/ubuntu/.ssh/authorized_keys
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689274129187/7aa85e87-4aa8-46a4-af5e-f14f3306b834.jpeg)
    
4. Once the private keys are copied, run the following command to test the connectivity to the nodes using Ansible:
    
    ```bash
    ansible all -m ping -i /etc/ansible/hosts
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689331041312/b17cab94-9570-48d3-8919-16064058d2f2.jpeg)
    

Congratulations! You have successfully completed the tasks for today. By installing Ansible, understanding the `hosts` file, and testing connectivity, you have taken the first steps towards leveraging the power of Ansible for configuration management.

Stay tuned for Day 56 of the #90DaysOfDevOps Challenge, where we will keep exploring Ansible.