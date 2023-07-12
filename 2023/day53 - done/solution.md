# #90DaysOfDevOps Challenge - Day 53 - Your CI/CD pipeline on AWS - Part 4 🚀 ☁

Welcome to Day 53 of the #90DaysOfDevOps Challenge. In today's challenge, we will explore AWS CodePipeline, a powerful service for building and deploying applications in a continuous integration and continuous delivery (CI/CD) pipeline.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688931455116/fd0498b9-2925-4885-8c5f-dbc08ca77456.jpeg align="center")

## What is CodePipeline?

**AWS CodePipeline** is a fully managed **continuous integration and continuous delivery (CI/CD)** service provided by **Amazon Web Services (AWS)**. It enables you to build, test, and deploy your applications quickly and reliably. CodePipeline automates the entire software release process, allowing you to deliver updates to your applications seamlessly.

With CodePipeline, you can define a series of stages, each representing a specific step in your software release workflow. These stages can include **source code repositories**, **build servers**, **testing environments**, and **deployment targets**. CodePipeline integrates with various AWS services and third-party tools, providing a flexible and extensible platform for building your CI/CD pipeline.

## Task 1: Setting Up a CodePipeline

* **Create a Deployment Group of EC2 Instances:**
    
    * Open the AWS Management Console and navigate to AWS CodeDeploy.
        
    * Click on "Create Deployment Group" and provide a name and description for the group.
        
    * Select the EC2 instances you want to include in the group and configure the deployment settings.
        
    * Define the deployment type, load balancer settings, and alarms for monitoring.
        
    * Save the deployment group configuration.
        
* **Create a CodePipeline:**
    
    * Go to the AWS Management Console and navigate to AWS CodePipeline.
        
    * Click on "Create pipeline" and provide a name and description for the pipeline.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689186788736/9a03fefd-e436-4cb6-98d4-d9dbc719c04b.jpeg align="center")
        
    * Provide the Pipeline name and select to create a New service role
        
    * ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689186904811/c9fd9acf-fc19-4125-8b08-3f5ddd102f94.jpeg align="center")
        
    * Configure the source stage by selecting CodeCommit as the source provider and specifying the repository and branch.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689186913073/31b95edf-e60b-4efd-a129-ab1590cbec81.jpeg align="center")
        
    * Configure the build stage by selecting CodeBuild as the build provider and specifying the build project.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689186952629/0c5a58c4-6bad-4d56-8a16-27340e3e571a.jpeg align="center")
        
    * Set up the deploy stage by selecting AWS CodeDeploy as the deploy provider and specifying the deployment group created earlier.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689186982636/533383de-8879-4ad9-8d20-4d3ec0fe6890.jpeg align="center")
        
    * Review the pipeline configuration and click on "Create pipeline" to create the CodePipeline.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689187187317/9ac92c71-bfff-43d5-87af-98b0ad42c3e1.jpeg align="center")
        
    * CodePipeline will fetch the code from CodeCommit, build the code using CodeBuild and deploy the application in the EC2 instance specified in CodeDeploy.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689187276728/2a7d94a4-d2d5-411c-8927-d67e51e32fbf.jpeg align="center")
        
    * Navigate to the public IP Address of the EC2 instance where the application has been deployed and verify the HTML website deployment works.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689187371102/8dd47916-5214-4578-abe3-be4f6e3d57d5.jpeg align="center")
        
    * We can verify the pipeline works by making a change in the index.html file and waiting for the pipeline to fetch the changes and build the app as explained earlier.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689187512891/0705efde-9ce1-42dc-90f0-201d9697f596.jpeg align="center")
        
    * The pipeline is executing and applying the changes.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689187552606/45c07f54-9a63-4355-aa32-b3de60f2d99b.jpeg align="center")
        
    * Refresh the browser and verify the changes have been successfully applied
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689187655083/c67d40d1-094a-41db-a3bd-9c671cef34d2.jpeg align="center")
        

By following these steps, you can create a CodePipeline that integrates CodeCommit, CodeBuild, and CodeDeploy. This enables a seamless flow of your application code from source control to build and deployment on the EC2 instances in the deployment group.

Congratulations on completing Day 53 of the challenge! Tomorrow, on Day 54, we will dive into a new topic: Infrastructure as Code (IaC) and Configuration Management. Discover how to provision and manage your AWS infrastructure using code, and learn about the benefits of automating configuration management. Stay tuned!