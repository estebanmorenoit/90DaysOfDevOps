# #90DaysOfDevOps Challenge - Day 58 - Ansible Playbooks

Welcome to Day 58 of the #90DaysOfDevOps Challenge. Today, we will explore the power of Ansible Playbooks and learn how they can streamline and automate our infrastructure management tasks. Let's get started!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689361824074/e870172d-4aa1-47d6-b0f9-53070737850f.webp align="center")

## Ansible Playbooks

Ansible Playbooks are at the **core** of Ansible's **automation capabilities**. They provide a way to **define** the **desired state** of your **infrastructure** and **execute** a series of **tasks** on **remote servers** to achieve that state. With Ansible Playbooks, you can **automate complex workflows**, **configure systems**, **deploy applications**, and much more.

A playbook is a **declarative YAML file** that **describes** the **tasks** and **configuration steps** needed to achieve a specific outcome. It consists of **plays**, which are **high-level descriptions** of the tasks to be performed on a set of hosts. Each play contains **tasks**, which are individual **steps executed** in order.

Ansible Playbooks are **human-readable** and allow you to express your desired **infrastructure state** simply and intuitively. You can **define variables**, **loops**, **conditions**, and use Ansible's extensive library of **modules** to interact with different systems and services.

## Example: Installing Docker using an Ansible Playbook

Let's take a look at an example of an Ansible playbook that installs Docker on a group of servers:

```yaml
---
- name: Install Docker
  hosts: servers
  become: true
  tasks:
    - name: Install Docker.io package
      apt:
        name: docker.io
        state: present
```

In this playbook, we define a play named "Install Docker" that targets the group of hosts specified in the inventory file under the "servers" group. By setting `become: true`, we ensure that the tasks are executed with elevated privileges (root). The task within the play uses the `apt` module to install the [`docker.io`](http://docker.io) package.

You can save this playbook in a YAML file, such as `install_docker.yaml`, and run it using the `ansible-playbook` command:

```shell
ansible-playbook -i inventory.ini install_docker.yaml
```

Make sure to replace `inventory.ini` with the path to your inventory file.

## Best Practices for Writing Ansible Playbooks

When writing Ansible Playbooks, it is important to follow best practices to ensure their effectiveness and maintainability. Here are some key best practices to consider:

1. **Organize Playbooks into Roles:** Roles help modularize your Playbooks, making them more reusable and easier to maintain. Separate your tasks, variables, and templates into role-specific directories.
    
2. **Use Variables and Templates:** Leverage variables and Jinja2 templates to make your Playbooks more dynamic and adaptable. Use variables for values that can change between environments or hosts.
    
3. **Implement Error Handling and Idempotence:** Incorporate error handling mechanisms, such as `failed_when` and `ignore_errors`, to handle unexpected situations gracefully. Ensure your Playbooks are idempotent, meaning they can be run multiple times without causing unintended changes.
    
4. **Thoroughly Test and Validate Playbooks:** Before deploying your Playbooks to production, thoroughly test them in staging or development environments. Validate the desired changes and ensure the Playbooks work as expected.
    

## Conclusion

With Ansible Playbooks, you can easily automate and orchestrate tasks in your IT infrastructure. By leveraging Playbooks, you can achieve efficiency, consistency, and reliability in your operations. Start exploring the possibilities of Ansible Playbooks and unlock the true potential of automation in your DevOps journey.

## Task 1: Hands-on with Ansible Playbooks

Let's get our hands dirty and tackle the following tasks using Ansible Playbooks:

Before getting through the below tasks, let's verify the servers are online:

```bash
 ansible all -m ping -i /etc/ansible/hosts
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689433664638/50019f6c-1544-4b04-8f3b-b509a2850630.jpeg align="center")

1. **Creating a file on a different server:**
    
    * Open your preferred text editor and create a new file called `create_file.yml`.
        
    * Start the playbook by specifying the target hosts and gathering facts. Then add a task to create the file. Specify the file's name, location, and content:
        
        ```yaml
        ---
        - name: Create a file on a remote server
          hosts: servers
          gather_facts: true
          become: true
          tasks:
          - name: Create a file
            copy:
              dest: /home/ubuntu/file-created-by-ansible.txt
              content: |
                This is the content of the file.
        ```
        
    * Save the playbook and exit the text editor. Then run the playbook file in the master server and review the output.
        
        ```bash
        ansible-playbook create_file.yml -i /etc/ansible/hosts 
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689433810309/544be8ae-c834-4ac4-b85d-0b448b202229.jpeg align="center")
        
    * Let's check if the file has been successfully created in one of the servers.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689433879682/56f2ee43-6be3-4139-8fe2-c807f35f4986.jpeg align="center")
        
2. **Creating a new user:**
    
    * Create another file called `create_user.yml` in your text editor.
        
    * Begin the playbook by defining the target hosts and necessary variables. Then add a task to create the user. Specify the username, password, and any additional user attributes:
        
        ```yaml
        ---
        - name: Create a new user on remote servers
          hosts: servers
          gather_facts: true
          become: true
          vars:
            username: esteban
            password: mypassword
          tasks:
            - name: Create a new user
              user:
                name: "{{ username }}"
                password: "{{ password | password_hash('sha512') }}"
                state: present
                createhome: yes
        ```
        
    * Save the playbook and exit the text editor. Then run the playbook file in the master server and review the output.
        
        ```bash
        ansible-playbook create_user.yml -i /etc/ansible/hosts 
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689435630107/7ff0651e-714f-4ee2-9200-f0ca50539431.jpeg align="center")
        
    * Let's verify the user has been successfully created in one of the servers.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689435706354/fc4f30a2-59ed-4c74-a2dc-6935acd3db11.jpeg align="center")
        
3. **Installing Docker on a group of servers:**
    
    * Create a file named `install_docker.yml` in your text editor.
        
    * Start the playbook by specifying the target hosts and necessary variables. Then add a task to install Docker using the appropriate package manager:
        
        ```yaml
        ---
        - name: Install Docker on multiple servers
          hosts: servers
          gather_facts: true
          become: true
          tasks:
            - name: Install Docker
              apt:
                name: docker.io
                state: latest
            - name: start and enable Docker
              service:
                name: docker
                state: started
                enabled: yes
        ```
        
    * Save the playbook and exit the text editor. Then run the playbook file in the master server and review the output. playbook.
        
        ```bash
        ansible-playbook install_docker.yml -i /etc/ansible/hosts 
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689436062238/55a878b5-e8f9-43bc-9462-07ffa8b4c379.jpeg align="center")
        
    * Let's verify Docker has been successfully installed, started and enabled in one of the servers.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689436149610/8a2deb93-b553-4d16-b627-03f8c6e4ff57.jpeg align="center")
        

Congratulations on completing Day 58 of the #90DaysOfDevOps Challenge. Today, you've explored Ansible Playbooks and gained hands-on experience with creating files, managing users, and installing Docker using Ansible. Stay tuned for tomorrow, where we'll embark on a new Ansible Project.