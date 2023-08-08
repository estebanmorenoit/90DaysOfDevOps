# #90DaysOfDevOps Challenge - Day 86 - DevOps Project 7 - Automating Portfolio Deployment on AWS S3 using GitHub Actions

Welcome to Day 86 of the #90DaysOfDevOps Challenge. Today, we have a new project where we'll automate the deployment of a Portfolio app on AWS S3 using GitHub Actions. GitHub Actions will enable us to achieve Continuous Integration and Continuous Deployment (CI/CD) with seamless integration with our GitHub Repository, streamlining our development workflow. Let's get started!

## Project Description

In this project, our main objective is to deploy a Portfolio app on AWS S3, a powerful and scalable storage service provided by Amazon Web Services. Leveraging GitHub Actions, we'll automate the entire process of building and deploying our Portfolio to AWS S3. With this automation, any changes we make to our GitHub repository will trigger automatic updates to our live website, making deployment a breeze.

## Hands-on Project: Automating Portfolio Deployment on AWS S3 using GitHub Actions

### **Step 1: Get the Portfolio Application from GitHub**

To begin, let's obtain the Portfolio application from the GitHub repository. Clone the repository to your local development environment or directly to your AWS server, where we'll configure AWS S3 and set up the GitHub Actions Workflow. I'll use my [portfolio website](https://github.com/estebanmorenoit/estebanmoreno-portfolio). I'll clone the code into a new repository for this project.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690911013645/7abea9bb-3289-455b-b2b1-c4f9786c10f6.jpeg align="center")

### **Step 2: Build the GitHub Actions Workflow**

Next, navigate to the project code repository on GitHub and choose the "Actions" option from the menu. Set up a new workflow for your Portfolio app by creating a YAML file that defines the necessary steps for the deployment process.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690911082925/cbf2f806-3409-4c23-9b19-3842c5f87b35.jpeg align="center")

Here's the YAML file I used in the project:

```yaml
name: Copy website to S3

on:
  push:
    branches:
    - main

jobs:
    copy-website-to-s3:
      runs-on: ubuntu-latest
      steps:
        - name: checkout
          uses: actions/checkout@master
  
        - name: sync s3
          uses: jakejarvis/s3-sync-action@master
          with:
            args: --follow-symlinks --delete --exclude '.git/*' --size-only
          env:
            AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
            AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
            AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
            AWS_REGION: 'us-east-1'
            SOURCE_DIR: './ '
```

### **Step 3: Setup GitHub Secrets for AWS CLI**

To enable interaction between the GitHub Actions Workflow and your AWS account, follow these steps:

1. Go to your repository's Settings.
    
2. Click on "Secrets and Variables" in the Actions menu.
    
3. Add the following secrets:
    
    * `AWS_S3_BUCKET` - Your S3 bucket name
        
    * `AWS_ACCESS_KEY_ID` - AWS CLI Access Key ID
        
    * `AWS_SECRET_ACCESS_KEY` - AWS CLI Secret Access Key
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690911538137/ddf3d4a5-3687-43f7-b962-de3930482cd2.jpeg align="center")
    

With these secrets configured, your GitHub Actions Workflow can securely access your AWS resources using the provided credentials during its execution.

### **Step 4: Setup AWS S3 with Public Access and Static Website Hosting**

Now, it's time to create an AWS S3 bucket and configure it for public access and static website hosting. This will make your Portfolio app accessible to users. I'll re-use the S3 Bucket created on Day 82 of the #90daysofdevops challenge.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690911696137/36077029-c1b4-4675-be8c-dafba3759aab.jpeg align="center")

### **Step 5: Update the Index.html File and Run the Workflow**

In your Portfolio app's index.html file, make a new change to trigger the GitHub Actions workflow. Once the changes are made, add, commit, and push them to the repository on GitHub.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690911918355/4c028ae6-3f5b-44b8-a531-5400769f4e3e.jpeg align="center")

### **Step 6: Execute the GitHub Actions Workflow**

With the workflow set up and the index.html file updated, the GitHub Actions Workflow will automatically execute. It will deploy your Portfolio app to the AWS S3 bucket, making it live and accessible to users.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690911940451/edf9ed8e-f7d7-4c78-aa27-3cf2ec93c297.jpeg align="center")

### **Step 7: Verify the Portfolio app is Deployed and Accessible**

Test the application's accessibility by accessing its URL in a web browser. Also, check how the GitHub Actions workflow has copied your portfolio app files into the S3 bucket specified in the YAML file.

**S3 Bucket:**

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690912082655/720300aa-bd66-4994-9420-187f195461a6.jpeg align="center")

**Portfolio Website:**

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690912150998/8c021194-21ba-4445-88ce-6a36525d2fc9.jpeg align="center")

Congratulations on completing Day 86 of the #90DaysOfDevOps Challenge. By automating the deployment of your Portfolio app on AWS S3 using GitHub Actions, you've gained valuable insights into streamlining CI/CD and efficiently managing your application's deployment. Stay tuned for tomorrow's challenge, where we'll dive into another exciting DevOps project!