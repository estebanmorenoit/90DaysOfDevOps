# #90DaysOfDevOps Challenge - Day 27 - Jenkins Declarative Pipeline with Docker

Welcome to Day 26 of the #90DaysOfDevOps challenge. Today, we'll take our Jenkins Declarative Pipelines to the next level by integrating Docker into our workflows. Let's get started!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686770583563/8ca0dc17-62b8-4234-8931-771f4f4fa98f.webp align="center")

## Enhancing Jenkins CI/CD with Docker

To integrate Docker into our Jenkins declarative pipeline, we'll utilize our knowledge of Docker build and run commands. Here's how you can incorporate them into your pipeline stages:

1. Docker Build: Use the `sh 'docker build . -t <tag>'` command in your pipeline's stage block to execute the Docker build process. Make sure you have Docker installed and have the necessary permissions.
    
2. Docker Run: Incorporate the `sh 'docker run -d <image>'` command in your pipeline's stage block to run the Docker container.
    

## Example of Pipeline Stages

Here's an example of how your pipeline stages might look when integrating Docker:

```bash
stages {
    stage('Build') {
        steps {
            sh 'docker build -t trainwithshubham/django-app:latest'
        }
    }
}
```

## Task 1: Create a Docker-Integrated Jenkins Declarative Pipeline

1. Open your Jenkins environment and navigate to the job or create a new job where you want to integrate Docker.
    
2. Configure the job as a Jenkins declarative pipeline by selecting the appropriate pipeline option.
    
3. Inside the pipeline block, define the stages of your pipeline using the syntax provided in the previous section.
    
4. In the stage where you want to incorporate Docker, add a new stage block and give it a suitable name (e.g., "Build").
    
5. Inside the "Build" stage, use the sh command followed by the Docker build command to build your Docker image.
    
6. ```bash
    pipeline {
        agent any
        stages {
            stage('Clone Code') {
                steps {
                    // Build steps go here
                    git url: 'https://github.com/estebanmorenoit/node-todo-cicd.git', branch: 'master'
                }
            }
            stage("Build"){
                steps{
                    sh 'docker build . -t node-todo-cicd'
                }
            }
            stage("Run"){
                steps{
                    sh 'docker run -d -p 8001:8000 node-todo-cicd'
                }
            }
    
        }
    }
    ```
    
7. Save the changes and run the pipeline to test the Docker integration. Note that you may encounter errors if the Docker container already exists, which will be addressed in the next task.  
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686940284666/dbbb5844-fcce-446e-be62-72e7a6c09f33.jpeg align="center")
    
8. If we try to run the job again, it will fail because the container is already created and the selected port is in use.  
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686940328923/20e7593a-2eb9-4eeb-992a-7bef5f6a9fb7.jpeg align="center")
    

## Task 2: Enhance the Docker-Integrated Pipeline

To resolve the error and improve the existing Jenkins declarative pipeline, we can incorporate Docker Compose into our workflow instead of directly running the container. This approach will involve pushing the built image to Docker Hub and utilizing a Docker Compose file to manage the container's lifecycle within the pipeline.

```bash
pipeline {
    agent any
    stages {
        stage('Clone Code') {
            steps {
                // Build steps go here
                git url: 'https://github.com/estebanmorenoit/node-todo-cicd.git', branch: 'master'
            }
        }
        stage("Build"){
            steps{
                sh 'docker build . -t node-todo-cicd'
            }
        }
        stage("Push to Docker Hub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUser")]){
                sh "docker tag node-todo-cicd ${env.dockerhubUser}/node-todo-cicd:latest"
                sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                sh "docker push ${env.dockerhubUser}/node-todo-cicd:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh 'docker compose down && docker compose up -d'
            }
        }
    }
}
```

Now, we can execute our pipeline multiple times without encountering any errors. This is because the pipeline now includes a step to shut down the existing container before creating new ones, ensuring a clean and consistent environment for each run.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686941259055/ba53b656-c50d-4baf-96d3-55e86481de0c.jpeg align="center")

That concludes Day 27 of the #90DaysOfDevOps challenge. We dived into the topic of Jenkins Declarative Pipelines, discovering their potential in building resilient and expandable CI/CD workflows. On Day 28, we'll explore Jenkins Agents. Stay tuned!