# #90DaysOfDevOps Challenge - Day 87 - DevOps Project 8 - Automating React App Deployment on AWS Elastic Beanstalk with GitHub Actions

Welcome to Day 87 of the #90DaysOfDevOps Challenge. Today, we have a new project ahead, where we will automate the deployment of a React application on AWS Elastic Beanstalk using GitHub Actions. With the power of GitHub Actions, we can seamlessly integrate continuous integration and continuous deployment (CI/CD) into our GitHub repository, making the deployment process efficient and automated.

## Project Description

In this project, our goal is to deploy a React application on AWS Elastic Beanstalk, a fully managed service that makes it easy to deploy, manage, and scale applications. By leveraging GitHub Actions, we can set up a CI/CD pipeline to automatically build and deploy the React app to Elastic Beanstalk whenever there is a new commit or a pull request in the GitHub repository.

Before we dive into the project, you can read this [blog](https://www.linkedin.com/posts/sitabja-chatterjee_effortless-deployment-of-react-app-to-aws-activity-7053579065487687680-wZI8?utm_source=share&utm_medium=member_desktop) for a better understanding of how the deployment process works with GitHub Actions and AWS Elastic Beanstalk.

# Hands-on Project: Automating React App Deployment on AWS Elastic Beanstalk

Welcome to this hands-on project where we'll walk through automating the deployment of a React app on AWS Elastic Beanstalk using Docker and GitHub Actions. By the end of this project, you'll have a fully functioning deployment pipeline for your React app.

## Step 1: Clone the Source Code

If you are using an Ubuntu machine, Git is likely pre-installed. Clone the repository and navigate to the project directory.

```bash
git clone https://github.com/estebanmorenoit/AWS_Elastic_BeanStalk_On_EC2.git
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690988954568/ffd2cb4d-c549-47c5-96a5-bdc9f2baf058.jpeg align="center")

```bash
cd AWS_Elastic_BeanStalk_On_EC2
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690973584302/5fae242b-03e7-47a7-9e52-80d4cfc7663f.jpeg align="center")

## Step 2: Set Up Docker

After cloning the code, find the `docker_install.sh` shell-script, which will install and enable Docker. Make it executable and run the script to install Docker.

```bash
chmod +x docker_install.sh
sh docker_install.sh
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690973978950/7729e0cb-44d3-4f38-b368-ec2a8b85beb7.jpeg align="center")

## Step 3: Create a Multi-Stage Dockerfile

Our React app requires Node.js to run and NGINX to serve requests after deployment. Let's create a multi-stage Dockerfile to address these requirements.

**Dockerfile:**

```Dockerfile
FROM node:14-alpine as builder
WORKDIR /app 
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build

FROM nginx 
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690974724510/64ee49bd-3637-4e48-ae82-8a5adaf2cfe5.jpeg align="center")

## Step 4: Build the Docker Image

With the Dockerfile in place, it's time to build the Docker image.

```bash
sudo docker build -t react-app-image .
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690975478411/4667325d-9737-45ab-8b62-839e0b4470c6.jpeg align="center")

## Step 5: Run the Docker Container

Launch a Docker container with the built image:

```bash
sudo docker run -d -p 80:80 react-app-image
```

Ensure the container is running using `docker ps` and confirm the application's activity by accessing the EC2 public IP on port 80.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690975780441/e5ddbbde-c387-4fb9-9f13-c9593977fdec.jpeg align="center")

## Step 6: Configure AWS Elastic Beanstalk

Go to the AWS Elastic Beanstalk service and click on "Create Application". Provide the required details, including a name for the application, select "Docker" as the platform, and choose "Sample Code" as a starting point.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690981026932/c8ac539b-fa30-4abc-832a-7eacfc142ac4.jpeg align="center")

After clicking "Create Application", wait for the environment to be set up.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690983988344/7e2ef105-4e50-42de-8093-801cb51ab035.jpeg align="center")

To access your deployed app, go to the "Domain" section and follow the URL provided. This link will lead you to your live React app running on AWS Elastic Beanstalk.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690984345075/10aad67e-3ed4-4b8c-aae9-a0f6112e51c5.jpeg align="center")

## Step 7: Enable CI/CD with GitHub Actions

We will use GitHub Actions for CI/CD. Locate the "deploy-react.yaml" file and move it under the ".github/workflows" directory. Update the file with relevant parameters such as branch name, application name, environment name, AWS access key, AWS secret access key and region.

```yaml
name : Deploy react application in BeanStalk
on :
    push:
        branches:
            - "main"
jobs:
    deploy: 
        runs-on: ubuntu-latest
        steps:
        - name: Checkout source code
          uses: actions/checkout@v2

        - name: Generate deployment package
          run: zip -r deploy.zip . -x '*.git*'

        - name: Deploy to EB
          uses: einaregilsson/beanstalk-deploy@v21
          with:
            aws_access_key: ${{ secrets.AWS_ADMIN_ACCESS_KEY_ID }}
            aws_secret_key: ${{ secrets.AWS_ADMIN_SECRET_ACCESS_KEY_ID }}
            application_name: react-app
            environment_name: React-app-env-2
            version_label: ${{ github.sha }}
            region: eu-west-2
            deployment_package: deploy.zip
```

## Step 8: Trigger GitHub Action CI/CD

Push all the codes under the "AWS\_Elastic\_BeanStalk\_On\_EC2" folder to the "main" branch of your GitHub repository. GitHub Actions will automatically trigger the CI/CD process.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690988690637/eb871a85-f180-4427-85b3-83c1eb8ab86d.jpeg align="center")

## Step 9: Check the Result

Verify the Elastic Beanstalk link received earlier. The sample application should now be replaced with our React app, which confirms a successful deployment.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690988714118/dce8d5cd-fe8c-4b40-96fe-a5828e142004.jpeg align="center")

Congratulations on completing this hands-on project! Day 87 of the #90DaysOfDevOps Challenge was all about automating the deployment of a React application on AWS Elastic Beanstalk using GitHub Actions. By setting up this CI/CD pipeline, you have streamlined the deployment process, ensuring that your app is always up-to-date and readily available to your users. Tomorrow, we'll dive into another exciting project. Stay tuned!