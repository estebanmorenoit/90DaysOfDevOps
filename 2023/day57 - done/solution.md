# #90DaysOfDevOps Challenge - Day 57 - Ansible Hands-on Project

Welcome to Day 57 of the #90DaysOfDevOps Challenge. Today, we will dive into an exciting hands-on project focused on practising Ansible installation, configuration, inventory file management, and ad-hoc commands. This project will provide you with valuable hands-on experience and help solidify your understanding of Ansible's core concepts and functionality.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689360425412/1c222a32-f07c-482c-8869-d5f33f65d168.jpeg)

## Ansible Hands-on Project

Throughout this project, you will learn how to **install Ansible** on your control node, **configure the inventory file** to define your target hosts and **execute ad-hoc commands** to perform quick checks and tasks on the target hosts. You will also gain experience in **writing and executing playbooks**, which allow you to automate complex tasks and orchestrate workflows.

By working on this project, you will develop a solid understanding of Ansible's **core concepts and functionality**. You will become familiar with the process of **setting up Ansible**, **managing inventory files**, executing ad-hoc commands, and expanding your project by creating more advanced playbooks. This hands-on experience will boost your **confidence** and **proficiency** in using Ansible for **automation** and **configuration management**.

Now, let's dive into the **step-by-step instructions** to kickstart this hands-on project and start exploring the **power of Ansible**.

## Task 1: Ansible Installation, Configuration, Inventory, and Ad-hoc Commands

To get started with the hands-on project, follow these step-by-step instructions:

1. Install Ansible:
    
    * Open your terminal or command prompt.
        
    * Execute the following command to install Ansible:
        
        ```bash
        sudo apt update
        sudo apt install ansible
        ```
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689421872622/0b2cf669-5d32-4eea-9b3e-4d368f23b014.jpeg)
    
2. Create an Ansible Project Directory:
    
    * Create a directory to serve as your Ansible project directory.
        
    * Change to the project directory using the following command:
        
        ```bash
        mkdir ansible-project
        cd ansible-project
        ```
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689422110868/22bbe6e5-6824-4d23-99b2-ee4d754f19b6.jpeg)
    
3. Configure the Inventory File:
    
    * Create a new file called `inventory.ini` using a text editor.
        
        ```bash
        sudo nano inventory.ini
        ```
        
    * Populate the file with the details of your target hosts, following the inventory file format:
        
        ```bash
        [servers]
        server1 ansible_host=<SERVER1_IP>
        server2 ansible_host=<SERVER2_IP>
        server3 ansible_host=<SERVER3_IP>
        ```
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689422232772/ca8fe297-6ad6-475c-a5bc-ea4a479f5553.jpeg)
    
4. Configure SSH Access:
    
    * Ensure that your control node can establish SSH connections to the target hosts.
        
    * Copy the public SSH key `id_rsa.pub` from the master node to the servers' `authorized_keys` files
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689422368230/70bd12c8-290c-4c06-98b3-43d6f4c4df4f.jpeg)
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689422456411/d5ec0d6f-39ae-45e7-afc7-c77080cc9ced.jpeg)
        
5. Practice Ad-hoc Commands:
    
    * Open your terminal or command prompt on the master node.
        
    * Execute ad-hoc commands to perform quick checks or tasks on the target hosts.
        
    * For example, to ping the target hosts, use the following command:
        
        ```bash
        ansible all -i inventory.ini -m ping
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689422540788/ee97868b-fab8-49a3-ac03-e2972f10632c.jpeg)
        
    * Execute shell commands on remote hosts. In this case, I will run the command `id`:
        
        ```bash
        ansible all -i inventory.ini -m shell -a "id"
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689422710501/750d847e-0f65-42d0-970d-a395be09c1f0.jpeg)
        
    * Install packages using the package manager. In this case, I will install Docker on all servers.
        
        ```bash
        ansible all -i inventory.ini -b -m apt -a "name=docker.io state=present"
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689423083090/4de24a8d-260f-4c7b-8be8-81f914124a67.jpeg)
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689423109390/7a4adc22-17c5-4bda-906f-2770c20edfb4.jpeg)
        
    * We can verify Docker is installed on Server1 by running the `systemctl status docker` command:
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689423188014/8dd0b4e4-dccf-40b9-8c95-ef92a266472b.jpeg)
        

Congratulations on completing Day 57 of the #90DaysOfDevOps Challenge. By undertaking this hands-on project focused on Ansible installation, configuration, inventory file management, and ad-hoc commands, you have gained practical experience and a deeper understanding of Ansible's capabilities. Stay tuned for the next day, where we'll explore Ansible Playbooks.