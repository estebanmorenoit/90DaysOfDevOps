# #90DaysOfDevOps Challenge - Day 7 - Understanding package manager and systemctl

Welcome to Day 7 of the #90DaysOfDevOps challenge. In today's challenge, we will explore package managers in Linux, learn about the powerful `systemctl` command, and understand the role of `systemd` in managing system services. Let's dive into these topics and enhance our understanding of package management and service management in Linux.

## Package Managers in Linux

Package managers are essential tools for installing, updating, and removing software packages on Linux distributions. They provide a centralized repository of packages and handle dependencies, ensuring smooth and efficient software installation.

### APT (Advanced Package Tool)

APT (Advanced Package Tool) is a widely used package management system primarily used in Debian-based distributions such as Ubuntu. It offers a user-friendly command-line interface to interact with the package management system.

With APT, you can perform various operations, including package installation, update, and removal. APT automatically resolves dependencies, ensuring that all required packages are installed correctly.

### YUM (Yellowdog Updater Modified)

YUM (Yellowdog Updater Modified) is another popular package management system used in Red Hat-based distributions like CentOS. It simplifies software package management and dependency handling.

YUM provides a command-line interface for managing packages. You can search for packages, install, update, and remove them using the YUM commands. It takes care of resolving package dependencies, ensuring a smooth installation process.

Both APT and YUM greatly simplify the process of managing software packages, making it efficient and hassle-free for DevOps engineers working on different Linux distributions.

## Systemctl and Systemd

`Systemctl` is a command-line utility used to manage system services in Linux distributions that adopt the `systemd` init system. `Systemd` is a system and service manager that provides advanced features such as process management, logging, and service dependencies.

`Systemd` replaces the traditional SysV init system and offers enhanced functionality and control over system services. It enables parallel service startup, efficient dependency management, and better monitoring and logging capabilities.

Key concepts related to `systemctl` and `systemd` include:

* **Service Units**: Systemd uses service units, which are configuration files with a `.service` extension, to define and manage services. These units describe the properties and behaviour of a service.
    
* **Service Management**: Systemctl offers commands like `start`, `stop`, `restart`, `enable`, and `disable` to manage services. These commands allow you to control the lifecycle and behaviour of services on your system.
    
* **System Status**: You can use `systemctl status` to obtain detailed information about a service, including its current status, enabled or disabled state, and recent log entries. This feature facilitates troubleshooting and monitoring of services.
    

`Systemctl` and `systemd` provides a modern and efficient approach to service management on Linux systems. They offer greater control, flexibility, and consistency in managing services, making it easier for DevOps engineers to handle various service-related tasks.

## Task 1: Installing Docker and Jenkins Using Package Managers

Let's now put our knowledge of package managers into action by installing Docker and Jenkins on Ubuntu using package managers.

### Installing Docker on Ubuntu

To install Docker on Ubuntu using APT, follow these steps:

### Set up the repository

1. Update the `apt` package index and install packages to allow `apt` to use a repository over HTTPS:
    
    ```bash
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    ```
    
2. Add Docker’s official GPG key:
    
    ```bash
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    ```
    
3. Use the following command to set up the repository:
    
    ```bash
    echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
    
4. Update the `apt` package index:
    
    ```bash
    sudo apt-get update
    ```
    
5. Install Docker Engine, containerd, and Docker Compose.
    
    ```bash
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```
    
6. Start Docker:
    
    ```bash
    sudo systemctl start docker
    ```
    

### Installing Jenkins on Ubuntu using APT

To install Jenkins on Ubuntu using APT, follow these steps:

1. Jenkins requires **Java** in order to run, so we'll update the Debian apt repositories, install OpenJDK 11, and check the installation with the commands:
    
    ```bash
    sudo apt update
    sudo apt install openjdk-11-jre
    java -version
    openjdk version "11.0.12" 2021-07-20
    OpenJDK Runtime Environment (build 11.0.12+7-post-Debian-2)
    OpenJDK 64-Bit Server VM (build 11.0.12+7-post-Debian-2, mixed mode, sharing)
    ```
    
2. Next, let’s install the Jenkins Long Term Support release by using the below commands:
    
    ```bash
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
      /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
      https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins
    ```
    
3. Start the Jenkins service:
    
    ```bash
    sudo systemctl start jenkins
    ```
    
4. Enable Jenkins to start on system boot:
    
    ```bash
    sudo systemctl enable jenkins
    ```
    
5. Jenkins should now be installed and running on your Ubuntu system. You can access it by opening your web browser and navigating to [`http://localhost:8080`](http://localhost:8080).
    

## Task 2: Checking the Status of the Docker Service

Now that Docker is installed, let's check the status of the Docker service using `systemctl`.

To check the status of the Docker service, run the following command:

```bash
systemctl status docker
```

The output will provide information about the current status of the Docker service, including whether it is running, enabled, and any recent log entries.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685562744687/376bedfd-e2e7-4d9f-8e19-99ec74fcd3e5.jpeg)

## Task 3: Stopping the Jenkins Service

Next, let's stop the Jenkins service and capture before and after screenshots.

To stop the Jenkins service, run the following command:

```bash
sudo systemctl stop jenkins
```

Before stopping Jenkins:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685650769275/5c07f300-dd12-41d3-8423-3fbf00eb3179.jpeg)

After stopping Jenkins:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1685650789828/b31a5884-b9e0-4aa6-b849-fb6fcc2d60b7.jpeg)

## Task 4: Understanding systemctl vs. service

`systemctl` and service are both command-line utilities used for managing services in Linux. However, there are some differences between them.

* `systemctl` is the primary command-line utility for managing services in Linux distributions that use `systemd`. It provides more advanced features and functionalities, such as service dependency management and improved logging.
    
* `service` is a backward-compatible command that works with both `systemd` and the older SysV init system. It is still available on many systems but is gradually being replaced by `systemctl`.
    

To compare the output of systemctl and service for a specific service, let's take the example of Docker.

Run the following commands to check the status of the Docker service using both systemctl and service:

```bash
systemctl status docker
service docker status
```

Observe the differences, if any, in the output of these commands. This exercise will help you understand the variations between systemctl and service and their usage in different Linux distributions.

Congratulations! You've completed Day 7 of the #90DaysOfDevOps challenge. Today, you gained insights into package managers, learned how to install Docker and Jenkins using APT, explored systemctl and systemd, and performed various tasks related to service management.

Stay tuned for Day 8, where we'll dive into Basic Git & GitHub for DevOps Engineers. Keep up the excellent work in your DevOps journey!