# #90DaysOfDevOps Challenge - Day 22 - Getting Started with Jenkins

Welcome to Day 22 of the #90DaysOfDevOps challenge. Today, we will explore Jenkins, a popular open-source automation server. Jenkins is widely used for continuous integration and continuous delivery (CI/CD) pipelines, making it an essential tool for DevOps engineers. Let's dive in and discover the power of Jenkins.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686514399421/09dab756-e4d0-411b-bb7f-e7fbcb9d6b80.webp align="center")

## What is Jenkins?

**Jenkins** is an extensible **automation server** that helps automate various aspects of software development processes. It provides a wide range of plugins and integrations, making it highly customizable and suitable for different project requirements. Jenkins is written in Java and runs on various platforms, including Windows, macOS, and Linux.

Jenkins enables the automation of repetitive tasks, such as **building**, **testing**, and **deploying applications**. It **integrates** with **version control systems**, **build tools**, and **testing frameworks**, allowing developers to streamline their workflows and improve collaboration.

With Jenkins, you can create **pipelines** to define the steps required to build, test, and deploy your applications. These pipelines can be configured using a domain-specific language called Groovy or through the Jenkins graphical interface.

## Task: Creating a Freestyle Pipeline to Print "Hello World!"

In this task, we will create a simple freestyle pipeline in Jenkins to print the classic "Hello World!" message. Follow these steps:

1. Log in to your Jenkins instance. In my case, I'm using AWS so we need to take the **Public IPv4 address** and use the **port 8080**:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686565232236/715c9d71-28e5-42ad-a33a-1e3e45f74fc6.jpeg align="center")
    
2. Click on **"New Item"** to create a new project.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686565299773/27bd3700-6a7e-4f0b-ac4e-6572ff5a014f.jpeg align="center")
    
3. Enter a name for your project (e.g., "HelloWorldPipeline") and select **"Freestyle project"** as the project type.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686565399235/2442bb00-1a23-46d6-b306-842527ac4d82.jpeg align="center")
    
4. In the configuration page, scroll down to the **"Build"** section and click on **"Add build step."**
    
5. Choose **"Execute shell"** from the options.
    
6. In the **command box**, enter the following command: `echo "Hello World!"`
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686565440439/e78c08d3-53b9-4ab8-b399-714071599eeb.jpeg align="center")
    
7. Apply and save your configuration.
    
8. Select **Build Now** to run the job and we will see the green mark to reflect it has been successfully executed.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686565571802/b228ca5b-42f6-43b8-b5b7-88ca8f57369e.jpeg align="center")
    
9. We can see the output by clicking on the **Build #1** icon and moving to **Console Output**:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686565695475/01e28886-75f1-44ea-90b9-5edc822bf9c3.jpeg align="center")
    

Now, you have successfully created a freestyle pipeline in Jenkins. When you run this pipeline, it will execute the "echo" command and print "Hello World!" as the output.

Feel free to explore more features and capabilities of Jenkins as you continue your DevOps journey. Jenkins offers a vast ecosystem of plugins, integrations, and community support, making it a powerful tool for automating your software development processes.

Stay tuned for Day 23, where we will work on a Jenkins freestyle project for DevOps Engineers.