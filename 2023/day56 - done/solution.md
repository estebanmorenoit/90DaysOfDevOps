# #90DaysOfDevOps Challenge - Day 56 - Understanding Ad-hoc commands in Ansible

Welcome to Day 56 of the #90DaysOfDevOps Challenge. Today, we will explore Ansible Ad-Hoc commands and their usage in automating various tasks. Let's get started.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689332955916/e114b05e-081b-48b6-80aa-649eda903c8f.png)

## **Ansible Ad-Hoc Commands**

Ansible Ad-Hoc commands are executed from the command-line interface (CLI) and follow a simple syntax. They can be used to perform a wide range of tasks, such as running commands, copying files, managing packages, and more. Ad-Hoc commands are especially useful for performing quick checks, troubleshooting, or executing tasks that don't require complex playbooks.

The beauty of Ad-Hoc commands lies in their simplicity and flexibility. Instead of writing a playbook with multiple tasks and roles, you can directly execute a command on one or more remote hosts. This allows you to quickly gather information, make changes, or perform tasks across your infrastructure with ease.

To use an Ad-Hoc command, you specify the target hosts using inventory patterns, and then provide the module and relevant parameters. For example, you can use the `command` module to execute a shell command on remote hosts, or the `copy` module to copy files from the control machine to the remote hosts. The possibilities are endless, and you can leverage the wide range of Ansible modules to accomplish various tasks.

Ad-Hoc commands are particularly helpful during troubleshooting scenarios. You can quickly check the status of services, inspect system information, or perform ad-hoc tasks to verify the behaviour of your infrastructure. Since Ad-Hoc commands are executed directly from the command line, they are a convenient way to interact with your servers without the need for writing, maintaining, and running complete playbooks.

## **Task 1 -** Exploring Practical Examples of Ad-Hoc Commands in Ansible

Let's dive into some practical examples of using Ad-Hoc commands in Ansible:

1. **Ping 3 servers from the inventory file:** Use the following Ad-Hoc command to ping three servers specified in your inventory file:
    
    ```bash
    ansible all -m ping -i /etc/ansible/hosts
    ```
    
    This command will send a ping request to each server and display the results.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689357119226/e0836552-92b4-47b7-93a3-c7d2a5a39747.jpeg)
    
2. **Check uptime on the servers:** To check the uptime of the servers, use the following Ad-Hoc command:
    
    ```bash
    ansible all -a uptime -i /etc/ansible/hosts
    ```
    
    This command will run the `uptime` command on each server and display the output.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689357147687/b478a657-be40-442f-b280-4a6df305cbee.jpeg)
    
3. **Explore more Ad-Hoc command examples:** Refer to the [**Ansible Ad-Hoc Commands blog**](https://www.middlewareinventory.com/blog/ansible-ad-hoc-commands/) for a comprehensive list of examples.
    

Stay tuned for the next day of the #90DaysOfDevOps Challenge, where we will continue our journey to explore more exciting aspects of DevOps and Ansible.