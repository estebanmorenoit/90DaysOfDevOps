# #90DaysOfDevOps Challenge - Day 59 - Ansible Project 🔥

Welcome to Day 59 of the #90DaysOfDevOps Challenge. Today, we will dive into an exciting Ansible project that will enhance your automation skills. In this project, we will explore Ansible Playbooks and accomplish various tasks to deploy an Nginx web server and host a sample webpage. Let's get started!

## Task 1: Deploying Nginx and Hosting a Sample Webpage

In today's project, we have the following tasks to accomplish:

1. **Create 3 EC2 instances:** We will create three EC2 instances, ensuring that all three are created with the same key pair. This key pair will allow us to securely access the instances.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689495018147/9e5c9183-1363-4ef7-b96d-ae11af6b58a2.jpeg align="center")
    
2. **Install Ansible on the host server:** To utilize Ansible's capabilities, we need to install it on our host server. This will serve as our control node for managing and orchestrating the deployment.
    
    ```bash
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt update
    sudo apt install ansible
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689495680560/272d1591-0914-4999-905d-0e782df60afd.jpeg align="center")
    
3. **Copy the private key:** We will copy the private key from your local machine to the host server (Ansible\_host) at the path `/home/ubuntu/.ssh`. This will enable secure SSH connections between the control node and the target hosts.
    
    ```bash
    scp -i “<<key pair name>>” <<key pair name>> ubuntu@<<public DNS of EC2>>:/home/ubuntu/.ssh
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689496044610/3bfe145e-628c-4ef7-bc59-ea0315e2d9d9.jpeg align="center")
    
4. **Access the inventory file:** We will access the inventory file located at `/etc/ansible/hosts` using the command `sudo vim /etc/ansible/hosts`. The inventory file contains the details of our target hosts.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689496268013/64947e07-f905-4b2c-8fce-97394a9c71e4.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689497082650/ff4e19a3-a88f-4001-8660-d6c38966e35c.jpeg align="center")
    
5. **Create a playbook to install Nginx:** Using Ansible's YAML syntax, we will create a playbook that installs Nginx on the target hosts. This playbook will define the necessary tasks and configurations to set up the web server.
    
    ```bash
    sudo nano nginx.yml
    ```
    
    ```yaml
    - name: This playbook will install nginx
      hosts: servers
      become: yes
      tasks:
        - name: install nginx
          apt:
            name: nginx
            state: latest
        - name: start nginx
          service:
            name: nginx
            state: started
            enabled: yes
    ```
    
    Now, we'll run this playbook by using the below command:
    
    ```bash
    ansible-playbook nginx.yml
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689497473623/2f1e6966-3fd3-498c-8f0e-7ed19556e79a.jpeg align="center")
    
    We can verify nginx is running on one of the servers:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689497567586/50ed31e6-0374-4b80-a089-786bcc4bdd7f.jpeg align="center")
    
6. **Deploy a sample webpage:** We will leverage Ansible Playbooks to deploy a sample webpage on the Nginx server. This will demonstrate the power of Ansible in automating the deployment of applications. First, let's create an index.html.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689502817672/cd2da54f-ea99-4b2c-befe-e678e27ca55a.jpeg align="center")
    
    Now, we have to edit the playbook created earlier and include a step to copy the `index.html` file to the `/var/www/html` directory
    
    ```yaml
    - name: This playbook will install nginx
      hosts: servers
      become: yes
      tasks:
        - name: install nginx
          apt:
            name: nginx
            state: latest
        - name: start nginx
          service:
            name: nginx
            state: started
            enabled: yes
        - name: Deploy website
          copy:
            src: index.html
            dest: /var/www/html
    ```
    
    Let's run the playbook again and verify if the website has been deployed on both servers.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689503044036/0ff68f76-d9b8-4f6d-ba99-8ca7d6e93dd5.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689503141412/69854d99-7bb0-4154-8e11-0321ad4fa093.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689503148749/d970475b-6f2c-4fd6-bab2-4b3f51e5cd6d.jpeg align="center")
    

Congratulations on completing Day 59 of the #90DaysOfDevOps Challenge. Today, we explored Ansible Playbooks and ventured into an engaging Ansible project. We learned how to create EC2 instances, install Ansible, copy private keys, access the inventory file, create a playbook to install Nginx and deploy a sample webpage. Stay tuned for Day 60 where we will start a new topic, Terraform!