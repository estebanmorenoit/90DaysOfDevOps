# #90DaysOfDevOps Challenge - Day 81 - DevOps Project 2 - Jenkins Declarative Pipeline

Welcome to Day 81 of the #90DaysOfDevOps challenge. Today's project focuses on automating the deployment process of a web application using Jenkins and its declarative syntax. By the end of this project, you will have a pipeline that includes various stages such as cloning, building, pushing to Docker Hub, clean up, and deploying. Let's dive in and start working on our DevOps Project 2!

## Project Description

Automate the entire web application development process using Jenkins and GitHub. Our goal is to build a powerful Jenkins pipeline for continuous integration and continuous deployment (CI/CD). Leverage Jenkins' automation capabilities and GitHub's version control to achieve seamless software delivery.

### Project Workflow:

1. **Code Changes Detection:** The pipeline automatically detects code changes in the GitHub repository.
    
2. **Build Stage:** Jenkins initiates the build stage, compiling code and generating artifacts.
    
3. **Deployment Stage:** After a successful build stage, the application goes live for users.
    

### **Notifications and Alerts:**

To stay informed about the pipeline's status and any critical issues, we'll configure notifications and alerts. Jenkins will send notifications to relevant team members through various communication channels, such as email, Slack, or other messaging platforms. This proactive approach ensures swift resolution of any potential problems.

## **Hands-on Project:** Jenkins Declarative Pipeline

### **Step 1: Set Up Jenkins**

1. Ensure you have Jenkins installed and running. If not, follow the installation instructions for your specific platform. I'll use an Ubuntu EC2 instance and the below User Data file.
    
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
    
    echo "Add Jenkins to Docker Group"
    echo "------------------------------------------------------------------"
    sudo usermod -aG docker jenkins
    ```
    
2. Access the Jenkins web interface by navigating to [`http://localhost:8080`](http://localhost:8080) or the URL where Jenkins is hosted.
    
3. Once logged in, proceed to install the suggested plugins.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690395991251/133a57fb-e40b-4bbf-a94e-b275ed533327.jpeg align="center")
    
4. Set up the necessary global configurations, such as DockerHub credentials and email notification settings, in Jenkins.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690396173747/9f712ddf-dd8a-4d45-acc7-6ccc6a40ed43.jpeg align="center")
    

### **Step 2: Create a New Jenkins Job**

1. Click on "New Item" on the Jenkins dashboard to create a new Jenkins job.
    
2. Enter a suitable name for the job (e.g., "DevOps Project 2").
    
3. Choose the "Pipeline" option and click "OK" to create the job.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690396225138/66be12c6-cc7b-4272-9514-93615474f0bc.jpeg align="center")
    

### **Step 3: Configure the Jenkins Pipeline**

1. In the General Section, tick the `GitHub project` box and provide your repository URL.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690396363018/470e873a-4e04-427f-8346-ab9592e9a899.jpeg align="center")
    
2. Move to the "Build Triggers" section, and select Poll SCM to trigger the Jenkins Pipeline when changes are discovered. We'll schedule it to run a scan every minute.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690396417857/c28fd72e-9689-442b-97b7-e824327d4660.jpeg align="center")
    
3. Navigate to the "Pipeline" section.
    
4. Select the "Pipeline script" option and enter the declarative pipeline syntax for your project.
    
    ```bash
    pipeline {
        agent any
        stages {
            stage('Clone Code') {
                steps {
                    // Build steps go here
                    git url: 'https://github.com/estebanmorenoit/django-notes-app.git', branch: 'main'
                }
            }
            stage("Build") {
                steps {
                    sh 'docker build . -t django-notes-app'
                }
            }
            stage("Push to Docker Hub") {
                steps {
                    withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: "dockerhubPass", usernameVariable: "dockerhubUser")]) {
                        sh "docker tag django-notes-app ${env.dockerhubUser}/django-notes-app:latest"
                        sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                        sh "docker push ${env.dockerhubUser}/django-notes-app:latest"
                    }
                }
            }
            stage("Cleanup") {
                steps {
                    // Stop and remove the container if it exists
                    sh 'docker stop django-notes-app || true'
                    sh 'docker rm django-notes-app || true'
                }
            }
            stage("Deploy") {
                steps {
                    // Run the container and bind port 8000
                    sh 'docker run -d -p 8000:8000 --name django-notes-app django-notes-app'
                }
            }
        }
        post {
            success {
                emailext (
                    to: 'morenoramirezesteban@gmail.com',
                    subject: 'Deployment Successful',
                    body: 'The deployment to production was successful. You can access the application at http://<ec2-instance-public-ip-address>:8000',
                )
            }
            failure {
                emailext (
                    to: 'morenoramirezesteban@gmail.com',
                    subject: 'Deployment Failed',
                    body: 'The deployment to production failed. Please check the Jenkins console output for more details.',
                )
            }
        }
    }
    ```
    
5. Apply the changes and save the Pipeline.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690396478169/6693e30b-ab81-4947-bf0e-20ebffce2ecb.jpeg align="center")
    

### **Step 4: Configure Notifications and Alerts:**

To set up email notifications using Gmail as the SMTP server in Jenkins, follow these steps:

1. Install the Email Extension Plugin:
    
    * Go to "Manage Jenkins" &gt; "Manage Plugins" &gt; "Available" tab.
        
    * Search for "Email Extension" in the filter box.
        
    * Check the checkbox next to "Email Extension" and click "Install without restart."
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690459476686/c1acc699-45f2-412c-93de-136c5eade564.jpeg align="center")
        
2. Configure Gmail SMTP Server in Jenkins:
    
    * Go to "Manage Jenkins" &gt; "Configure System."
        
    * Scroll down to the "Extended E-mail Notification" section.
        
    * In the "SMTP server" field, enter Gmail's SMTP server address: [`smtp.gmail.com`](http://smtp.gmail.com)
        
    * Set the "Default user e-mail suffix" to [`@gmail.com`](http://gmail.com)
        
    * Click "Advanced" to expand additional settings.
        
    * Set "SMTP port" to `465`.
        
    * Check the "Use SMTP Authentication" box.
        
    * Enter your Gmail email address in the "User Name" field.
        
    * Click "Add" to add a new "Password" and enter your Gmail account's password.
        
    * Check the "Use SSL" box.
        
    * Save the configuration.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690459566232/54c85fcc-82ef-43c0-a860-d6ca4865b888.jpeg align="center")
        
3. Enable "Less Secure Apps" in Gmail (Only if Required):
    
    * If you encounter authentication issues, you may need to enable "Less Secure Apps" in your Gmail account settings.
        
    * Go to [https://myaccount.google.com/security](https://myaccount.google.com/security).
        
    * Under "Signing in to Google," click "App passwords."
        
    * Sign in to your Google account if prompted.
        
    * Scroll down to "Allow less secure apps" and turn it ON.
        
    * Generate an app password and use it in the Jenkins email configuration instead of your regular Gmail password.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690460224758/1793d208-fb79-4ee7-82ea-7871ce6f1a69.jpeg align="center")
        

### **Step 5: Trigger the Jenkins Job**

1. Push changes to your project's repository on GitHub to trigger the Jenkins job.
    
2. Jenkins will automatically detect the changes and start running the pipeline.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690459187247/686feafe-6791-4edb-a35f-1bfcb426b61c.jpeg align="center")
    

### **Step 6: Monitor and Verify the Pipeline**

1. Monitor the progress of the pipeline execution in the Jenkins web interface. Check the console output for any errors or issues.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690459214574/416be7f0-0565-4247-8dec-ee56e9d5aa74.jpeg align="center")
    
2. Navigate to `http://<ec2-instance-public-ip-address>:8000` and access your newly deployed app.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690456916352/ab59be66-f3ed-43b1-a19b-48b5f2aa9509.jpeg align="center")
    
3. Wait for an email notification to land in your inbox
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690459422017/9dfae8f0-fa1c-4ba2-9f3b-e0928291c20c.jpeg align="center")
    

In today's challenge, we tackled DevOps Project 2, automating the deployment process of a web application using Jenkins. We covered setting up Jenkins, creating a Jenkins pipeline, defining stages, triggering the pipeline, and deploying the web application to our environment. By completing this project, we have gained practical experience in continuous integration and continuous deployment (CI/CD) practices. Stay tuned for a new project on Day 82 of the #90daysofdevops challenge!