# #90DaysOfDevOps Challenge - Day 28 - Jenkins Agents

Welcome to Day 28 of the #90DaysOfDevOps challenge. In today's session, we will dive into Jenkins Agents and explore how they can enhance the scalability and efficiency of your Jenkins environment. Jenkins Agents, also known as slaves, are additional compute resources that can be connected to a Jenkins master to execute jobs.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687036137680/f399c3b4-42a3-4a63-9070-6bc6a98247e7.webp)

## What are Jenkins Agents?

Jenkins agents, also known as slaves, are worker nodes that can be connected to a Jenkins master. They serve as additional compute resources to execute jobs and distribute the workload across multiple machines. Agents can be physical or virtual machines or even cloud instances. By leveraging agents, you can parallelize job execution, increase overall capacity, and improve the scalability and efficiency of your Jenkins infrastructure.

## Benefits of Using Jenkins Agents

Using Jenkins agents offers several advantages:

### Scalability and Parallel Execution

Agents enable parallel execution of jobs, allowing you to run multiple jobs concurrently. This significantly reduces the time required to complete your CI/CD pipelines, especially in large-scale projects with multiple tasks and dependencies.

### Resource Optimization

By distributing the workload across multiple agents, you can optimize resource utilization. Agents can be configured with different hardware specifications, allowing you to allocate resources according to job requirements. This ensures that each job runs in an environment tailored to its specific needs.

### Flexibility and Compatibility

Jenkins agents support a wide range of platforms and operating systems, including Windows, Linux, macOS, and various cloud platforms. This flexibility allows you to execute jobs on different environments, ensuring compatibility with your target deployment environments.

## Task 1: Create an Agent by Setting up a Node on Jenkins

1. Check if you already have Java installed on your Ubuntu system
    
    ```bash
    java -version
    ```
    
2. To install OpenJDK 11, run:
    
    ```bash
    sudo apt install openjdk-11-jdk -y
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687083080326/950ce93e-649c-4be1-9a61-1da764318f94.jpeg)
    
3. Create our SSH key on Jenkins Sever by using the below command
    
    ```bash
    ssh-keygen
    ```
    
4. Once created, we will share it with the Jenkins Agent by using the below command
    
    ```bash
    ssh-copy-id jenkins-agent-ip-address
    ```
    
5. On Jenkins, navigate to 'Manage Jenkins' &gt; 'Manage Nodes' and select 'New Node' to create a new permanent agent.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687083214345/4d2ca802-0455-43de-b5f4-7017391c6ea0.jpeg)
    
6. On the configuration page, fill out the required details. Set the remote root directory to specify the path where projects will be executed. Give the node a recognizable name as it will be used in the pipeline syntax to select which agent is used.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687083587386/731d1b19-dfaa-4b4b-afa9-2777aa479c4a.jpeg)
    
7. In the launch method, select 'Launch agents via SSH'. Add the host IP address in the Host field. Select the credentials and create a new one with the kind 'SSH Username with private key'. Tick the 'Enter directly' box under Private Key and copy and paste the Private Key of the Jenkins Server.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687084814445/5394f993-821a-4151-9bdb-889ff424f1d6.jpeg)
    
8. Once the credentials have been added, select the 'Host Key Verification Strategy' as 'Manually trusted key Verification Strategy' and tick the 'Require manual verification of initial connection' box.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687084923160/4d447445-0cba-4db1-8c2c-dc3b674fde3e.jpeg)
    
9. After the agent is created, select the menu 'Trust SSH Host Key' and choose 'Yes' to trust the connection.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687084991681/234f695f-7d92-4bb8-ab6f-0d926e49f0f9.jpeg)
    
10. Finally, verify that the node is successfully connected to your Jenkins server.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687085294400/094fc8b9-e091-4b69-b539-eadac2c6ade8.jpeg)
    

## Task 2 - Run Previous Jobs on the New Agent

1. Now that we have our Jenkins Agent set up, we can modify our existing pipeline from Day 27 to use the new agent. Below is the updated pipeline syntax:
    
    ```bash
    pipeline {
        agent {
            label "jenkins-agent"
        }
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
    
2. With the updated pipeline, we can now build it using the new agent and observe how it creates our container on the Jenkins Agent.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687087174769/52c9cf62-5359-4a51-a3e6-72daae531829.jpeg)
    
3. After the pipeline execution, you can access the container using the Jenkins Agent IP Address.
    
    You have successfully run your previous jobs on the new agent.
    

Congratulations on completing Day 28 of the #90DaysOfDevOps challenge. In this article, we explored Jenkins Agents and learned how to set up and use them to distribute workloads and improve scalability. By connecting agents to your Jenkins master, you can enhance the efficiency and performance of your CI/CD pipelines. We also covered the steps to create an agent and run jobs on the newly created agent.