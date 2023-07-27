# #90DaysOfDevOps Challenge - Day 23 - Jenkins Freestyle Project for DevOps Engineers

Welcome to Day 23 of the #90DaysOfDevOps challenge. Today, we will dive into Jenkins freestyle projects and explore how they can be utilized by DevOps engineers to automate CI/CD processes. We will also discuss the concepts of CI/CD, build jobs, and freestyle projects. So, let's get started!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686593012238/a41f663f-2ae1-4474-a4c7-dcb32d133dd3.png)

## **Understanding CI/CD**

**CI/CD** stands for **Continuous Integration and Continuous Delivery/Deployment**. It is a set of practices that aim to automate and streamline the software development lifecycle. **CI** focuses on **merging code changes frequently** and a**utomating build and test** processes to catch issues early. **CD** extends this further by **automating the delivery or deployment** of applications to various environments.

## **Exploring Build Jobs**

In Jenkins, a build job represents a single execution of a build process. It includes tasks such as compiling code, running tests, and packaging the application. Build jobs play a vital role in CI/CD pipelines as they ensure that each code change is validated, tested, and built consistently.

## **Understanding Freestyle Projects**

Freestyle projects are a flexible and customizable project type in Jenkins. They provide a simple and intuitive way to configure and automate complex build processes. With freestyle projects, you have the freedom to define your build steps, configure triggers, and set up post-build actions according to your project's requirements.

Now, let's proceed with the resolution of the tasks for today.

## **Task-01: Building and Running a Docker Container**

1. Ensure the Jenkins user is added to the Docker Group to be able to run docker commands via Jenkins:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686596298098/5e94b6c8-ee14-41cf-9ec6-d97ddbca3d2f.jpeg)
    
2. Create a new Jenkins freestyle project for your app:
    
    * In the Jenkins dashboard, click on "New Item" to create a new project.
        
    * Enter a name for your project and select "Freestyle project."
        
    * Click "OK" to proceed.
        
3. Configure the build steps:
    
    * In the Source Code Management section, I will use my GitHub Repository URL to access the Dockerfile
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686596436036/0604106b-37fe-4eae-82db-c5434b1eab34.jpeg)
        
    * In the project configuration page, scroll down to the "Build" section.
        
    * Click on "Add build step" and select "Execute shell"
        
        ```bash
        cd /var/lib/jenkins/workspace/90daysofdevops-day23/2023/day23/tasks
        docker build . -t dockerapp:latest
        echo "Image created"
        ```
        
4. Add a step to run the container:
    
    * Click on "Add build step" again and select "Execute shell."
        
        ```bash
        cd /var/lib/jenkins/workspace/90daysofdevops-day23/2023/day23/tasks
        docker run -d -p 3000:3000 dockerapp:latest
        echo "Container is created and running"
        ```
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686596719608/83849907-98c5-4fb9-8cd7-199b05d66caf.jpeg)
    
5. Apply and save your project configuration.
    
6. Click on "Build Now" to start the build process and wait until the docker image is created and running on a docker container accessible from port 3000
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686597022741/1cdeef9e-53e4-4bff-90e4-b2a9490cbab6.jpeg)
    
7. Verify the docker container is running and access the app
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686597152789/8cb82548-1592-4fd3-90b5-082e1dcf960f.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686597200469/ccd79a27-7a24-4973-ac26-bff96dcc2ab9.jpeg)
    

## **Task-02: Running Docker Compose with Jenkins**

1. Create a Jenkins project for Docker Compose:
    
    * Create a new freestyle project in Jenkins, following the steps mentioned earlier.
        
2. Configure the build steps:
    
    * Scroll down to the "Build" section of the project configuration page.
        
    * Click on "Add build step" and select "Execute shell."
        
    * Enter the command "docker-compose up -d" to start the multiple containers defined in your Docker Compose file.
        
    * Click on "Build Now" to start the build process
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686598362133/bfdbbc75-298f-4af7-9f53-c550ee55671a.jpeg)
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686598435896/9c1e3345-74fc-4192-9814-65c46ddcca57.jpeg)
        
3. Set up the cleanup step:
    
    * Scroll down to the "Post-build Actions" section.
        
    * Click on "Add post-build action" and select "Execute shell."
        
    * Enter the command "docker-compose down" to stop and remove the containers defined in your Docker Compose file.
        
    * Click on "Build Now" to start the build process
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686598558387/754a6690-c1b4-4ddd-81ef-5840596dacb3.jpeg)
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686598583714/324f2bc7-0ec7-443a-b0ce-d9ec6fa04ef9.jpeg)
        

Congratulations! You have successfully created Jenkins freestyle projects to automate the build and deployment of your application using Docker and Docker Compose.

Jenkins, with its flexibility and wide range of integrations, provides DevOps engineers with a powerful platform to automate CI/CD processes. By leveraging the capabilities of freestyle projects, you can customize your build steps, configure triggers, and automate deployment tasks to achieve efficient and reliable software delivery.

Stay tuned for tomorrow's challenge, where we will continue exploring Jenkins with a new CI/CD Project.