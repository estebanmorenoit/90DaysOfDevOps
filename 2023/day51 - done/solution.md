# #90DaysOfDevOps Challenge - Day 51 - Your CI/CD pipeline on AWS - Part 2 🚀 ☁

Welcome to Day 51 of the #90DaysOfDevOps challenge! In today's session, we will dive deeper into building your CI/CD pipeline on AWS. Specifically, we will explore AWS CodeBuild, a fully managed continuous integration service offered by Amazon Web Services (AWS).

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688907855839/b9ac72cb-2bc9-4ff1-bb63-92dffe10d50e.png)

## What is CodeBuild?

AWS CodeBuild is a **fully managed build service** provided by **Amazon Web Services (AWS)** that **automates** the process of **building, testing, and packaging software applications**. It offers a **scalable and reliable infrastructure** for **compiling source code, running tests, and generating deployable artifacts**. With **seamless integration** with other AWS services, CodeBuild allows you to create a complete **CI/CD pipeline**.

To use CodeBuild effectively, you define a **build specification file** called **buildspec.yaml**. This file outlines the **build commands, tests, and artifacts** to be generated. Here's an example of a buildspec.yaml file:

```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      java: corretto11
    commands:
      - echo "Installing dependencies..."
      - npm install

  build:
    commands:
      - echo "Building the application..."
      - npm run build

  post_build:
    commands:
      - echo "Running tests..."
      - npm test

artifacts:
  files:
    - '**/*'
  discard-paths: yes
```

In this example, the **buildspec.yaml** file defines three phases: **install, build, and post\_build**. The **install phase** specifies the runtime version and installs the necessary dependencies. The **build phase** builds the application, and the **post\_build phase** runs the tests. Finally, the **artifacts section** defines the files to be included in the build output.

By customizing the **buildspec.yaml** file according to your project's requirements, you can instruct CodeBuild on how to build, test, and package your application. This configuration file is stored alongside your source code in a version control repository, such as **AWS CodeCommit**.

CodeBuild's features like **caching, parallel execution, and integrations** with external services help **optimize build performance** and **streamline the development workflow**. It provides **detailed build and test reports** for analysis and issue identification. By leveraging CodeBuild, you can enhance the **efficiency and reliability** of your software development process, enabling you to deliver **high-quality applications** with ease and speed.

## Task 1: Build a Simple Website with CodeBuild

Let's get hands-on with CodeBuild! Follow these steps to build a simple website using CodeBuild:

1. **Create a Simple index.html File in CodeCommit Repository**: Go to your CodeCommit repository and create a new file named `index.html`. Populate it with the desired content for your website's homepage. Save the file in the repository.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688997924159/36e82350-f057-43ca-a397-6e81930e7273.jpeg)
    
2. **Clone the repository to your instance:** Open your EC2 instance, clone the code and verify the `index.html` file is in the repository directory.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689013167395/c193c400-54f4-47ee-bf3d-b46fcab262a5.jpeg)
    
3. **Add buildspec.yaml File to CodeCommit Repository**: Create a new file named `buildspec.yaml` in your CodeCommit repository. Configure the Buildspec file to execute the necessary build commands, including the installation of dependencies, building the project, running tests, and generating artifacts. Make sure to specify the desired output artifacts and their locations. Once created, push the changed to the CodeCommit Repository.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689075775907/8a3b3407-70db-401b-9b01-41437b2a792f.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689014210366/8c720a10-425b-4cce-bc8a-2f1d81a3617e.jpeg)
    
4. **Complete the Build Process**: Navigate to the CodeBuild section of AWS and select 'Create build project'. Provide the project details such as name and description and select the repository from which the project will pull the code.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689014847569/8435e7af-3993-4e29-a7cc-bed29ced8c77.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689014959573/2626fa1d-7496-49c1-836d-9c0a3e2b6814.jpeg)
    
    Provide the environment details and the Role name. In this case, I will use Ubuntu.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689016020397/afe6e8cf-2a30-4314-8760-d5e28dfda3e8.jpeg)
    
    Select to use a buildspec file and create the build project.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689016100896/21ddb813-9295-4ee3-8f64-1f497f1d3391.jpeg)
    
    Verify the project build details and click on 'Start build'
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689016249074/7ccbe002-8d38-4a92-969e-1e480fe1d776.jpeg)
    
5. **Verify the build:** Verify the build is successful and the build phases were completed with no errors.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689068604623/6e397e93-dc9a-4026-9996-2e598b1eb0ce.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689068616006/3bad9b87-9463-45a2-a852-cc1c26fc5b3e.jpeg)
    
6. **Store the artifact:** To store the artifact, we need to create an S3 bucket first. Navigate to the S3 service in the AWS console and provide the details to create the bucket.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689072850040/3020c1ce-bf03-4f6c-bcde-540a1e6d8c17.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689073551484/05606651-de2c-43b8-9b90-2c9de1ad1057.jpeg)
    
    Now, we can navigate to the CodeBuild project build, click on edit and select `artifacts`. Provide all the necessary details and create the artifact.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689073621669/1a7009b8-42d0-4ba6-85ad-92fbf3c72459.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689073670824/72a7ad6f-b8df-430f-a853-6db8f011bc55.jpeg)
    
    Retry build after adding the `artifacts` section. You can see the phase `UPLOAD_ARTIFACTS` was successful.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689073794364/fb0bb8e7-9905-466f-91b7-e9ebfb7d0778.jpeg)
    
7. **Test the artifact:** Navigate to the S3 bucket created earlier and you will see a new folder which contains the artifact created by CodeBuild.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689075329393/a4fb794e-8c9b-41b5-a569-8a46628b04b0.jpeg)
    
    Go inside the folder and open the index.html. Select the Open button at the top to open the web app in the browser.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689075379850/525f3392-15c4-4091-9373-2bd7dbbe48ab.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689075408903/0ee76442-c808-4217-9ee6-e0a6a0280c0a.jpeg)
    

With these steps completed, you have set up your build process using CodeBuild. It will automatically compile your source code, execute the specified build commands, and generate the desired artifacts.

Remember to commit and push the `index.html` file and the `buildspec.yaml` file to your CodeCommit repository to trigger the build process.

Congratulations on completing Day 51 of the #90DaysOfDevOps challenge. In this session, we explored AWS CodeBuild and learned how to build a simple website using CodeBuild. Stay tuned for tomorrow's session as we continue our journey in building an efficient CI/CD pipeline on AWS.