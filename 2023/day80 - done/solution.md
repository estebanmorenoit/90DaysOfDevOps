# #90DaysOfDevOps Challenge - Day 80 - DevOps Project 1 - Jenkins Freestyle Project

Welcome to Day 80 of the #90DaysOfDevOps challenge. Today, we are diving into our first DevOps project, where we will automate the building and deployment process of a web application using Jenkins and GitHub. This project will empower you to efficiently manage the development lifecycle and streamline the deployment process. So, let's get started!

## Project Description

**Project Aim:** Automate the building and deployment process of a web application using Jenkins and GitHub.

**Project Overview:** In this project, we will create a Jenkins pipeline that will be triggered automatically by GitHub whenever changes are made to the code repository. The pipeline will include multiple stages such as cloning the code from GitHub, building the application and deploying the application on the target server. Additionally, we'll set up notifications and alerts to inform us in case of any failed builds or deployments.

## **Hands-on Project:** Jenkins Freestyle Project

1. **Set up GitHub Repository:**
    
    * If you haven't already, create a GitHub repository to host the web application's code.
        
    * Push your web application code to the repository. I'll use my [django-notes-app repository](https://github.com/estebanmorenoit/django-notes-app)
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690369049417/0fa0cedd-7fbc-468f-bbfe-9c8cae07c83c.jpeg align="center")
        
2. **Install and Configure Jenkins:**
    
    * Create a new EC2 instance. Install Docker and Jenkins using the below User Data file.
        
        ```bash
        #!/bin/bash
        
        echo "Docker installation"
        echo "------------------------------------------------------------------"
        sudo apt update
        sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt update
        sudo apt install -y docker-ce docker-ce-cli containerd.io
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo usermod -aG docker $USER
        
        echo "Jenkins installation"
        echo "------------------------------------------------------------------"
        sudo apt update
        sudo apt install -y openjdk-17-jre
        curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
          /usr/share/keyrings/jenkins-keyring.asc > /dev/null
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
          https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
          /etc/apt/sources.list.d/jenkins.list > /dev/null
        sudo apt-get update
        sudo apt-get install -y jenkins
        ```
        
    * Once created, connect using your preferred method and verify Docker and Jenkins are up and running.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690369671170/41bf0c47-5db5-429c-a965-f3370756d9ba.jpeg align="center")
        
3. **Install Required Jenkins Plugins:**
    
    * Access the Jenkins dashboard in your web browser and install the suggested plugins.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690370161183/71ed3db8-c941-4243-92d9-25ed08b5a0ef.jpeg align="center")
        
    * Create your user and log in with the newly created username and password.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690370308535/fb0378a2-2e46-4569-9b3e-fa118cda2b88.jpeg align="center")
        
4. **Create Jenkins Pipeline:**
    
    * In the Jenkins dashboard, click on "New Item."
        
    * Enter a name for your pipeline and select "Freestyle" as the project type.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690390224397/836e96fa-bb28-48a2-9c43-bd00d0a2f8eb.jpeg align="center")
        
    * Under "Source Code Management," choose "Git" and provide your GitHub Repository URL.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690390303188/3eb8cf01-95f3-4d60-a21b-d02b3d94d974.jpeg align="center")
        
    * In the "Build Triggers" section, select Poll SCM to trigger the Jenkins Pipeline when changes are discovered. We'll schedule it to run a scan every minute.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690391378220/f34d0b30-7122-4406-a033-23798bf37899.jpeg align="center")
        
    * Select "Delete workspace before build starts" to ensure every time we run the Jenkins Pipeline, there are no residual files.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690391485491/c57cd559-5dc8-4026-9251-d97742a6e6de.jpeg align="center")
        
    * Lastly, we will set up our Pipeline in the "Build Steps" section. Let's add a new build step, with the type 'Execute shell' and add the below instructions.
        
        ```bash
        echo "Clone Code Stage --------------------------------"
        cd /var/lib/jenkins/workspace/devops-project-1
        git clone https://github.com/estebanmorenoit/django-notes-app
        echo "Build Stage --------------------------------"
        cd /var/lib/jenkins/workspace/devops-project-1/django-notes-app
        docker build . -t django-notes-app
        echo "Image created"
        echo "Deploy Stage --------------------------------"
        docker stop django-notes-app || true
        docker rm django-notes-app || true
        docker run -d -p 8000:8000 --name django-notes-app django-notes-app
        echo "Container is created and running"
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690394394762/96a31d9e-d9e7-4fe1-a877-3b922e24f1bd.jpeg align="center")
        
    * Apply the changes, and save the Pipeline.
        
5. **Run the Pipeline:**
    
    * Make changes to your web application code and push them to the GitHub repository.
        
    * The GitHub changes will automatically trigger the Jenkins pipeline.
        
    * Monitor the pipeline's progress in the Jenkins Pipeline dashboard.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690394507567/35901930-5d3f-4763-acc3-3ca697586a56.jpeg align="center")
        
6. **Test the Pipeline:**
    
    * Check the job's console output, where we can see if the Docker container has been successfully created.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690394528975/097b144a-344c-4d9c-ba3b-d9003918d2c1.jpeg align="center")
        
    * Navigate to `http://<ec2-instance-public-ip-address>:8000` and access your newly deployed app.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690394872825/6c948a2a-66f3-4473-8eac-372be2b8d889.jpeg align="center")
        
7. **Configure Notifications and Alerts:**
    
    * Click on Manage Jenkins-&gt;Configure System. Here scroll down to the Email Notification section. Now enter the details as the following image
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690392842355/26591abb-4aeb-4f96-acd6-4c58b597ee18.jpeg align="center")
        
    * If you use Gmail with MFA enabled, follow the below steps:
        
        Create a custom app in your Gmail security settings.
        
        1. Log in to Gmail with your account
            
        2. Navigate to [https://security.google.com/settings/security/apppasswords](https://security.google.com/settings/security/apppasswords)
            
        3. In 'select app' choose 'custom', give it an arbitrary name and press generate
            
        4. It will give you 16 chars token.
            
        
        Use the token as a password in combination with your full Gmail account and two-factor authentication will not be required.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690392930594/0cc114a7-8c38-4345-8508-a4412d6b8e84.jpeg align="center")
        
    * Use Jenkins' built-in features to set up email notifications for pipeline status (success/failure) in the "Post-build Actions"
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690392669001/16a0438f-bdcc-460f-87a5-45b1e6cd0400.jpeg align="center")
        
    * Modify the Pipeline Build Steps to ensure the job fails, and wait for an email notification to land in your inbox
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690394633997/1a545b71-7bb4-4e77-bd5e-9e06fd6ac67f.jpeg align="center")
        

Congratulations on completing Day 80 of the #90DaysOfDevOps challenge! Today, we successfully set up a Jenkins pipeline to automate the building and deployment of a web application using GitHub. We configured the Jenkins pipeline to be triggered automatically using Poll SCM whenever changes are pushed to the GitHub repository. Additionally, we set up notifications and alerts to stay informed about the pipeline's status.

Tomorrow, we'll take our DevOps journey further and explore a new project where we'll upgrade this project by using a Jenkins Declarative Pipeline instead. Stay tuned!