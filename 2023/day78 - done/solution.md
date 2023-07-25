# #90DaysOfDevOps Challenge - Day 78 - Monitoring with Grafana Cloud

Welcome back to the #90DaysOfDevOps Challenge. On Day 78, we'll explore the powerful capabilities of Grafana Cloud for monitoring your infrastructure and cloud resources. Grafana Cloud offers a comprehensive monitoring solution that allows you to gain valuable insights into the performance and health of your systems. Let's dive in and learn how to set up alerts for EC2 instances and AWS Billing Alerts using Grafana Cloud.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690307944309/6ed27077-a6bf-4a7f-9a17-6358697323e6.jpeg align="center")

## Grafana Cloud: A Comprehensive Monitoring Solution

Grafana Cloud is a robust and scalable monitoring platform that provides a wide range of monitoring capabilities for your infrastructure, applications, and cloud resources. With Grafana Cloud, you can consolidate all your monitoring needs into a single platform, allowing you to gain real-time visibility into the performance and health of your systems. The platform's intuitive interface and powerful features make it an ideal choice for DevOps teams to effectively monitor their environments.

## Task: Setting Up Alerts for EC2 Instances and AWS Billing Alerts

**Step 1: Create an EC2 Instance -** Start by creating an EC2 instance in your AWS environment. This instance will be monitored using Grafana.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690304703004/a5f65367-9eb9-4bdd-b54d-0ada3f8fe1fc.jpeg align="center")

**Step 2: Set up Grafana Cloud Console -** If you haven't set up Grafana Cloud yet, follow the steps in my previous blog post on how to set up Grafana Cloud.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690304735786/80e9d355-fc8d-490e-9253-9c202ed42db9.jpeg align="center")

**Step 3: Connect Data to AWS**

1. On the Grafana Cloud home page, navigate to the "Connections/Add new connection" section.
    
2. Click on "AWS" to access the setup for AWS account integration.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690304789115/9c6cefd2-2f53-4170-9013-5d15e4c54ced.jpeg align="center")

**Step 4: Select CloudWatch Metrics**

1. In the dashboard, select CloudWatch metrics for integration between AWS and Grafana Cloud.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690304883644/5c3ba02d-a829-4368-9f5b-973617e4aca4.jpeg align="center")

**Step 5: Create AWS IAM Role -** For CloudWatch integration, you need to create an AWS IAM Role. Follow the given steps in the screenshot to set up the IAM Role via CloudFormation.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690305032108/05e33331-8d48-450f-9a05-4f219f9f6594.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690305051431/c93d50cf-44ac-4ca4-a4ab-a752562c98f7.jpeg align="center")

**Step 6: Access CloudWatch Metrics Dashboard -** After successful integration, go to the home page and open the dashboard. Select the CloudWatch Metrics dashboard to view visualized data with real-time tracking.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690305173647/e3c1ad8c-df06-4568-a3e6-fccce45fd494.jpeg align="center")

**Step 7: Set Up Alerts for CPU Utilization** - Now we will set up an alert for CPU utilization when it reaches 75%.

1. Click on "Create Alert Rule" for CPU utilization above 75%.
    
2. Select the metric `as_ec2_cpuutilization_maximum`, then select the instance ID, and set the threshold value to 75%.
    
3. Run the query to check the output.
    
4. Click "Save Rule" to save the alert rule.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690306294482/26e6f3fe-bc84-46d2-958b-5d68d7e2a183.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690306349518/92e2a756-475f-4b6f-8556-2838d877148b.jpeg align="center")

**Step 8: Configure Alerting Emails -** To receive alert notifications via email, follow these steps:

1. Click on "Manage Contact Points."
    
2. Edit the `grafana-default-email` contact point.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690306541944/ca04c858-687d-4620-b3d9-88aad42bb14a.jpeg align="center")

1. Put your email address in the "Address" field and click "Test" for verification.
    
2. You will receive a test alert email to confirm the setup.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690306591222/2f923faf-c589-495d-8edd-411b30420df1.jpeg align="center")

**Step 9: Set Up Notification Policies**

1. Click on "Manage Notification Policies."
    
2. Select the label and value for the notification (e.g., "alert" and "critical").
    
3. Choose the contact point you previously created for alerting emails.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690306774291/2fcb9b27-9e28-4829-bed4-135980e4cc13.jpeg align="center")

**Step 10: Set Up Alerts for Billing** In this step, we will set up an alert to avoid overspending on AWS services. We'll create an alert if the estimated billing charges go above $10.

1. Select "Manage Alert Rule."
    
2. Choose the metric `aws_billing_estimated_charges_average` and sum them.
    
3. Set the threshold value to 5$.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690307751823/d42bb18c-fd8f-44b2-b8ff-6944ffeaf450.jpeg align="center")

1. Add a new notification policy for billing above $5.
    

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690307834411/59e0b45e-0cc2-4872-bce4-528a8d5388ef.jpeg align="center")

Congratulations! You've now set up monitoring and alerting for your EC2 instances and AWS billing in Grafana Cloud. With Grafana Cloud's powerful monitoring capabilities, you can proactively respond to issues and ensure the optimal performance of your infrastructure.

Stay tuned for Day 79 of the #90daysofdevops challenge, where we'll explore Prometheus!