# #90DaysOfDevOps Challenge - Day 47 - Test Knowledge on AWS 

Welcome to Day 47 of the #90DaysOfDevOps Challenge. In today's session, we will put our AWS knowledge to the test and explore some hands-on exercises to deepen our understanding of AWS services. We will focus on two tasks: launching an EC2 instance and creating an Auto Scaling group. Let's dive in!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688847922408/32702966-baa7-4635-b43f-5bfd51458452.jpeg)

## Task 1: Launch an EC2 Instance and Deploy a Web Application

### Step 1: Launch an EC2 instance using the AWS Management Console

* Log in to the AWS Management Console.
    
* Navigate to the EC2 service.
    
* Click on "Launch Instances" and follow the wizard to configure your instance.
    
* Select the desired instance type, security group, and other settings.
    
* Choose an appropriate Amazon Machine Image (AMI) for your web server.
    
* Review your configuration and launch the instance.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688841415191/a5dd0c96-213c-48e1-8b30-304af38e8365.jpeg)
    

### Step 2: Connect to the EC2 instance using your preferred method

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688841545450/3b2bd8a0-0ede-498d-b6f9-a9d7ec56886a.jpeg)

### Step 3: Install a web server and deploy a simple web application

* Update the package manager on your EC2 instance.
    
    ```bash
    sudo apt update
    ```
    
* Install a web server of your choice (e.g., Apache, Nginx). You can test it by accessing the public IP Address of the EC2 instance once installed.
    
    ```bash
    sudo apt install apache2
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688841692316/b88ca8f3-4c6a-46b5-b925-b2913759eb4a.jpeg)
    
* Deploy a simple website `index.html` to the appropriate directory `/var/www/html`
    
    ```xml
    <!DOCTYPE html>
    <html>
    <head>
        <title>Esteban Moreno - #90daysofdevopschallenge</title>
    </head>
    <body>
        <h1>Esteban Moreno - #90daysofdevopschallenge</h1>
        <p>Welcome to my simple website.</p>
    </body>
    </html>
    ```
    
* Test the web application by accessing the public IP address of your EC2 instance in a web browser.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688842209754/e1f3917d-168e-42f3-903b-6b40f623a94e.jpeg)
    

### Step 4: Monitor the EC2 instance using Amazon CloudWatch

* Go to the Amazon CloudWatch service in the AWS Management Console.
    
* Create a new CloudWatch dashboard.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688842666962/65028eea-06dc-4043-8f09-a6c9cc5f1611.jpeg)
    
* Add widgets to monitor key metrics of your EC2 instance, such as CPU utilization, network traffic, and disk usage.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688843106753/325f7eda-5e32-4e39-9a60-88eeafdf092a.jpeg)
    
* Set up CloudWatch alarms to receive notifications when certain thresholds are exceeded.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688843786754/3942322c-5964-424d-9939-59fe3c83945f.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688843900539/c4ad39ac-41f5-4e71-af33-a2b4f7d4b183.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688843950090/8d7b908c-dcd3-4b90-8582-c8b5c0bb2a2c.jpeg)
    
* Monitor the performance of your EC2 instance and troubleshoot any issues that arise.
    

## Task 2: Create an Auto Scaling Group and Monitor Performance

### Step 1: Create an Auto Scaling group using the AWS Management Console

* Navigate to the Auto Scaling service in the AWS Management Console.
    
* Click on "Create Auto Scaling group" and follow the wizard to configure your group. A template of the existing EC2 is required to create an ASG.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688845512809/e9d94a91-6a2a-43bc-847f-ed155bdfbda8.jpeg)
    
* Navigate to the existing EC2 instance and create a template
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688845977741/db7109dd-3be9-48fb-8306-7922b7e1b580.jpeg)
    
* Specify the desired capacity, instance type, and other settings.
    
* Set up scaling policies based on demand or schedule.
    
* Configure the desired monitoring and health checks for your instances.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688846490126/26630eba-b10b-482d-8de4-21b09b8cde9b.jpeg)
    

### Step 2: Use Amazon CloudWatch to monitor the performance of the Auto Scaling group

* You can navigate to the Monitoring section of the Auto Scaling Group to view the monitored metrics.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688846785459/27466319-31b3-4517-80cd-fe9357363b2d.jpeg)
    
* You can add the above metrics to the dashboard created earlier.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688847053047/2e4ba2ff-7e12-4e5d-a23d-c371d0a4775f.jpeg)
    
* Set up CloudWatch alarms to receive notifications using the available metrics.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688847200021/5924847b-425d-4755-bee4-5c40008f1090.jpeg)
    
* Monitor the performance of your Auto Scaling group and troubleshoot any issues that arise.
    

### Step 3: Use the AWS CLI to view the state of the Auto Scaling group and the EC2 instance

* Install the AWS CLI on your local machine if you haven't already.
    
    ```xml
    sudo apt install awscli
    ```
    
* Configure the AWS CLI with your AWS credentials.
    
    ```xml
    aws configure
    ```
    
* Use the AWS CLI commands to view the state of your Auto Scaling group, such as the number of instances running and the scaling activities.
    
    ```xml
    aws autoscaling describe-auto-scaling-groups
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688847562883/fcb77c17-7506-4e42-8f6d-505c4af262e7.jpeg)
    
* Verify that the correct number of instances are running and that the Auto Scaling group is functioning as expected.
    
    ```xml
    aws ec2 describe-instances
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688847662953/db1b6bf6-3d21-4d6a-aeed-0a27a9d4d415.jpeg)
    

Congratulations! You have completed the tasks for Day 47 of the #90DaysOfDevOps Challenge. By launching an EC2 instance, deploying a web application, creating an Auto Scaling group, and monitoring the performance using Amazon CloudWatch, you have gained valuable hands-on. Stay tuned for a new AWS service on day 48.