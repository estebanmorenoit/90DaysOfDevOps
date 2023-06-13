# #90DaysOfDevOps Challenge - Day 24 - Complete Jenkins CI/CD Project

Welcome to Day 24 of the #90DaysOfDevOps Challenge. Today, we'll dive into the world of Jenkins CI/CD projects and explore how they enable efficient and automated software delivery. We'll also take a closer look at GitHub Webhooks and their role in enhancing CI/CD pipelines.

## Understanding Jenkins CI/CD Project

Jenkins is a popular open-source automation server that enables the implementation of CI/CD pipelines. A CI/CD project in Jenkins involves automating the software delivery process, ensuring rapid and reliable deployment of applications. It provides a flexible platform to integrate various tools and technologies, allowing developers to streamline the development lifecycle.

Here are some key stages in a typical Jenkins CI/CD pipeline:

1. **Code Checkout**: The pipeline begins by fetching the latest code changes from a version control system like Git. This ensures that the pipeline operates on the most up-to-date codebase.
    
2. **Build**: In this stage, the code is compiled, dependencies are resolved, and the application is built into executable artifacts. Jenkins leverages build tools like Maven or Gradle to perform these tasks.
    
3. **Testing**: Automated tests are executed to validate the functionality and quality of the application. This includes unit tests, integration tests, and even performance tests. Jenkins integrates with testing frameworks such as JUnit and Selenium to facilitate comprehensive testing.
    
4. **Static Code Analysis**: Static code analysis tools like SonarQube or Checkstyle are utilized to identify code quality issues, security vulnerabilities, and adherence to coding standards. Jenkins integrates with these tools to enforce best practices during the development process.
    
5. **Artifact Storage**: The built artifacts are stored in a repository for future use. Jenkins can publish the artifacts to artifact repositories like Nexus or JFrog, ensuring traceability and easy access to the generated binaries.
    
6. **Deployment**: Once the build and tests pass successfully, the application is deployed to a staging or production environment. Jenkins supports various deployment strategies, such as deploying to cloud platforms like AWS or using containerization technologies like Docker and Kubernetes.
    
7. **Post-Deployment Testing**: Additional tests, such as smoke tests or integration tests, are conducted on the deployed application to validate its functionality in the target environment. Jenkins can trigger these tests automatically as part of the pipeline.
    
8. **Release**: If all the tests pass, the application is considered ready for release. Jenkins can automate the release process by creating release artifacts, updating version numbers, and notifying stakeholders about the successful deployment.
    
9. **Monitoring**: Continuous monitoring of the application and infrastructure is crucial to ensure its stability and performance. Jenkins can integrate with monitoring tools like Prometheus or New Relic to collect metrics and generate alerts based on predefined thresholds.
    

## Exploring GitHub Webhooks

GitHub Webhooks play a vital role in enhancing CI/CD pipelines by enabling seamless integration between Jenkins and the version control system. Webhooks are event-driven triggers that notify Jenkins whenever certain events occur in a GitHub repository, such as code pushes or pull requests.

By configuring Github Webhooks, you can automate the execution of Jenkins pipelines whenever a relevant event takes place in the repository. This ensures that your CI/CD pipeline is triggered automatically, saving time and effort for developers.

For example, you can set up a webhook to trigger the Jenkins pipeline whenever a new commit is pushed to the repository. This allows for immediate build and testing of the code changes, providing rapid feedback to the development team.

GitHub Webhooks can also be configured to trigger specific Jenkins jobs based on different events, such as opening a pull request or creating a new release. This level of flexibility allows you to customize your CI/CD workflow based on your project's requirements.

Tasks

* Fork [this](https://github.com/LondheShubham153/node-todo-cicd.git) repository
    
* Create a connection to your Jenkins job and your GitHub Repository via GitHub Integration. Set up the schedule at every minute (you can use this tool - [https://crontab.guru/#*\_\*\_*](https://crontab.guru/#_*_) *)*, so we can get Jenkins to scan our repository for new updates at every minute.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682416488/dc31caea-8c89-4c19-8d17-86b82fb1ab29.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682410115/ae09a475-35ce-4013-92b8-7e7edeeb4d47.jpeg align="center")
    
* In the Execute shell run the application using Docker compose
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682474256/27b75805-943f-4bdf-98be-c3b6e13f6b03.jpeg align="center")
    
* Let's make a change to the docker-compose.yml file and see how Jenkins will trigger a new build job and run our docker-compose file.  
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682862916/64ca2550-b890-4686-8660-d683530f56cc.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682856244/9f1a9545-e2ec-4eb5-b52a-c43ac2da715e.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682848820/04781c13-bb5d-4c97-bc2a-27d6b2e7ac79.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686682842894/2e7f5d59-629b-4150-97e6-d71b363f5151.jpeg align="center")
    

Congratulations on completing Day 24 of the #90DaysOfDevOps Challenge. Today, we explored the concept of Jenkins CI/CD projects and how they streamline the software delivery process. We also learned about GitHub Webhooks and their significance in automating Jenkins pipelines.

Stay tuned for Day 25 where we'll continue exploring Jenkins.