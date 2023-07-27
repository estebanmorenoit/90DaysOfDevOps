# #90DaysOfDevOps Challenge - Day 52 - Your CI/CD pipeline on AWS - Part 3 🚀 ☁
Welcome to Day 52 of the #90DaysOfDevOps Challenge. Today, we'll dive into the powerful world of AWS CodeDeploy and explore how it can revolutionize your CI/CD pipeline on AWS. Let's get started!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688930765808/d14ee149-d3f8-463a-8982-a13a443af2a0.png)

## What is CodeDeploy?

**AWS CodeDeploy** is a fully managed deployment service provided by **Amazon Web Services (AWS)**. It automates the process of deploying applications to a variety of compute services, including **Amazon EC2 instances**, **AWS Fargate**, and on-premises servers. CodeDeploy simplifies the release process, ensuring fast, reliable, and consistent deployments.

CodeDeploy enables you to define deployment configurations and deploy your applications using different deployment strategies, such as **rolling updates**, **blue/green deployments**, and **in-place deployments**. It integrates seamlessly with other **AWS services**, making it an essential component of your **CI/CD pipeline**.

With CodeDeploy, you can easily manage deployments for applications written in various **programming languages** and frameworks. It provides flexibility in defining **pre- and post-deployment hooks**, which allows you to perform custom actions, such as running scripts or executing tests, before or after each deployment.

Additionally, when using AWS CodeDeploy, you can include an `appspec.yaml` file. This file defines the deployment instructions and lifecycle events for your application. Here's an example of an `appspec.yaml` file:

Certainly! Here's a generic example of an `appspec.yaml` file:

```yaml
version: 0.0
os: linux

files:
  - source: /
    destination: /path/to/destination

permissions:
  - object: /path/to/destination
    pattern: "**"
    owner: <owner>
    group: <group>
    mode: <permissions>

hooks:
  BeforeInstall:
    - location: scripts/before_install.sh
      timeout: <timeout>
      runas: <user>

  AfterInstall:
    - location: scripts/after_install.sh
      timeout: <timeout>
      runas: <user>

  ApplicationStart:
    - location: scripts/application_start.sh
      timeout: <timeout>
      runas: <user>
      
  PreTraffic:
    - location: scripts/pre_traffic.sh
      timeout: <timeout>
      runas: <user>

  PostTraffic:
    - location: scripts/post_traffic.sh
      timeout: <timeout>
      runas: <user>
```

In this generic example, you need to replace the placeholders enclosed in "&lt;&gt;" with the appropriate values for your application. Here's an explanation of the different sections:

* `version` specifies the version of the `appspec.yaml` file.
    
* `os` specifies the operating system for which the deployment is intended.
    
* `files` define the files to be deployed, with the source and destination paths.
    
* `permissions` sets the permissions for the destination directory.
    
* `hooks` define the different lifecycle event hooks and their associated scripts. You can include additional hooks as needed, such as `PreTraffic` and `PostTraffic` for blue/green deployments.
    

Remember to customize the `file paths`, `permissions`, `scripts`, and `timeouts`, and `runas` values based on your specific application and deployment requirements.

By combining AWS CodeDeploy and the `appspec.yaml` file, you can automate the deployment process, ensuring consistent and reliable deployments for your applications. This simplifies your release management and enhances the efficiency of your CI/CD pipeline.

## Task 1: Configuring CodeDeploy

To deploy the index.html file on an EC2 machine using CodeDeploy, follow these steps:

1. **Set up an EC2 instance**: Launch an EC2 instance with your desired operating system and configuration. Make sure the instance has the necessary security groups and permissions to communicate with CodeDeploy.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689090781124/ba95982d-5bb9-4b9c-b438-80cfe542c490.jpeg)
    
2. **Create an IAM role**: Create an IAM role that grants the necessary permissions for CodeDeploy to access your EC2 instances and perform deployments. Attach the role to the EC2 instance.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689184474403/ce39eec1-8b3c-4073-abfd-e7d4c0b24def.jpeg)
    
    Ensure CodeDeploy can assume the role:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689094132121/81f5fa01-b9b9-476e-b3bf-a76e42f2536a.jpeg)
    
3. **Create an application in CodeDeploy**: Go to the CodeDeploy console and create an application.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689092754348/4e462a10-f6e4-4eaf-aa08-80c86e4bf845.jpeg)
    
    Specify the deployment platform as EC2/On-premises and configure the deployment settings according to your requirements.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689092832076/5703fed9-9417-4385-af27-ad361b14a5df.jpeg)
    
4. **Create a deployment group**: Within the application, create a deployment group that defines the set of EC2 instances where you want to deploy your application. Specify the deployment configuration and deployment type.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689092860106/57b679b2-93fb-4418-8884-ac38a022aa26.jpeg)
    
    Provide the `deployment group name` and `service role` to use:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689093078924/40f98fb2-9e3a-479b-a0c4-a3aa7e71ab95.jpeg)
    
    Add the EC2 instance details in the `Environment configuration` section. Select `never` install the `Agent configuration with AWS Systems Manager` as we'll install it manually Untick the Load Balancer box to not use ALB and hit the `Create deployment group` button
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689093336466/cda34cda-4acc-4333-8379-1a04ccece5e5.jpeg)
    
    Verify the deployment group details:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689094188457/b0e19eb7-ffb2-4f4a-b7ef-fe7940e2d535.jpeg)
    
5. **Install and configure the CodeDeploy agent**: Connect to the EC2 instance and install the CodeDeploy agent. The agent enables communication between the instance and the CodeDeploy service. Configure the agent to automatically start on boot. Follow the [AWS Official Documentation](https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html) for step-by-step instructions.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689092316732/94cd7b4b-d5b5-4bdd-a3fa-f021760f3e91.jpeg)
    

## Task 2: Adding `appspec.yaml` to CodeCommit Repository and Completing the Deployment Process

To complete the deployment process in CodeDeploy, follow these steps:

1. **Create an** `appspec.yaml` **file**: In your CodeCommit repository, create an `appspec.yaml` file if you haven't already. This file defines the deployment instructions and lifecycle events for your application.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689098132317/920c5954-49eb-40f4-93c2-6647854c63ca.jpeg)
    
2. **Define deployment lifecycle events, specify the source files, and define hooks and scripts**: Within the `appspec.yaml` file, define the deployment lifecycle events, such as `BeforeInstall`, `AfterInstall`, `ApplicationStart`, and `ValidateService`. These events specify the actions to be performed at each stage of the deployment process. In the `appspec.yaml` file, specify the source files to be deployed. You can include the index.html file and any other necessary files or directories. Define hooks and scripts that should be executed during the deployment process. For example, you can run scripts to install dependencies, configure the environment, or start the application.
    
    ```yaml
    version: 0.0
    os: linux
    
    files:
      - source: /
        destination: /var/www/html
    
    hooks:
      BeforeInstall:
        - location: scripts/install_dependencies.sh
          timeout: 300
          runas: root
    
      ApplicationStart:
        - location: scripts/start_server.sh
          timeout: 300
          runas: root
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689178934524/c0cf5a6c-30be-4f4f-bec0-b7cd8f7d1fb2.jpeg)
    
    I've also created the below scripts to use with the `appspec.yaml` file:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689184631048/07365026-642a-454e-a244-68e73ad719c8.jpeg)
    
3. **Commit and push changes**: Commit the `appspec.yaml` file with your deployment instructions to the CodeCommit repository and push the changes.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689098219919/94487280-75a0-4e5f-86bd-015623d49875.jpeg)
    
4. **Build the project:** We have to build the artifact again but first, we need to edit the Artifacts settings, so it will create the artifact in a zip file and store it in the S3 bucket we created on an earlier day.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689184814445/987712c4-85c3-4fa4-8404-540750c83d64.jpeg)
    
    Save and click on `Start build:`
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185043075/43d02ca9-2b30-42e4-9d03-cab7947ea336.jpeg)
    
    Verify the zip file has been created in the S3 bucket:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185092407/76c0f919-d805-41d1-b6dc-d01ac9c41fad.jpeg)
    
5. **Create IAM role for EC2:** We need a role to give access to EC2 instances to the relevant services, wth the below permission policies:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185266079/9c4b7268-6f94-4184-bcf1-c3d869dc7154.jpeg)
    
    Once created, go to your EC2 instance and assign the IAM role:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185332692/f37cc24b-7b60-4156-b084-ab1099544e65.jpeg)
    
6. **Start the deployment**: Go to the CodeDeploy console, select your application, and start a new deployment. Choose the appropriate deployment group and the revision location from your CodeCommit repository.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689098595418/802b14b1-d4bd-4bcb-9aaa-b4a79381a1f9.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185394832/8a462774-89f8-4d33-bd67-29cf6e962128.jpeg)
    
7. **Monitor the deployment**: Monitor the deployment progress in the CodeDeploy console. You can view the deployment logs, check the status of each deployment step, and troubleshoot any issues that arise.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185492625/bb79ba72-3744-4018-b7fe-3c00ed0800e2.jpeg)
    
8. **Test the deployment:** Copy the EC2 instance public IP address and paste it into your preferred browser. Your HTML website will successfully load
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185527711/a2caab78-8702-4ec5-a3b5-a819ae185bb7.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689185555065/2becf7f4-feb8-4e90-88c8-b6d7e2c2fc9b.jpeg)
    

By following these steps, you can successfully deploy your `index.html` file on an EC2 instance using AWS CodeDeploy. The `appspec.yaml` file provides the instructions and configuration needed to ensure a smooth deployment process.

Congratulations on completing Day 52 of the #90DaysOfDevOps Challenge. You've learned how to deploy applications using AWS CodeDeploy and witnessed the power of automated deployments. Stay tuned for Day 53 as we continue exploring CI/CD on AWS.