# #90DaysOfDevOps Challenge - Day 46 - Set up CloudWatch alarms and SNS topic in AWS

Over the past few days, we have explored various AWS services and learned how they contribute to the world of DevOps. Today, on Day 46 of the #90DaysOfDevOps Challenge, we will focus on setting up CloudWatch alarms and configuring an SNS topic in AWS. These powerful tools will help us monitor and receive notifications about critical events within our AWS environment. Let's dive in!

## Amazon CloudWatch - Empowering Monitoring and Analysis

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688324746343/f7e0868e-3d71-4208-8eb3-789fc3076bc2.png align="center")

Amazon CloudWatch is a powerful monitoring service offered by AWS. It provides a wide range of features to help you monitor and analyze the performance of your applications and resources. With CloudWatch, you can collect and track metrics, monitor log files, set alarms, and gain valuable insights into the health and efficiency of your systems.

Some key features of Amazon CloudWatch include:

1. **Metrics Collection**: CloudWatch allows you to collect and store metrics from various AWS services, such as **EC2 instances**, **RDS databases**, **S3 buckets**, and more. These metrics provide visibility into resource utilization, performance, and operational health.
    
2. **Log Monitoring**: CloudWatch enables you to centralize and monitor logs from your applications and systems. You can easily search and analyze log data to identify patterns, troubleshoot issues, and gain valuable insights into your application's behaviour.
    
3. **Alarms and Notifications**: With CloudWatch, you can set alarms based on specific metric thresholds. When an alarm is triggered, you can receive notifications via various channels, including email, SMS, or even trigger automated actions through AWS Lambda functions.
    
4. **Dashboards and Visualization**: CloudWatch provides customizable dashboards where you can create visualizations and charts to represent your metrics data. This allows you to easily monitor and analyze key performance indicators and trends.
    
5. **Integration with AWS Services**: CloudWatch seamlessly integrates with other AWS services, such as AWS Lambda, AWS Elastic Beanstalk, and AWS Auto Scaling. This enables you to automate actions, scale resources, and respond to changing workload demands based on CloudWatch metrics.
    

For example, you can set up CloudWatch alarms to monitor the **CPU utilization** of your EC2 instances. If the CPU utilization exceeds a certain threshold, an alarm will be triggered, and you can receive a notification to take appropriate actions, such as adding more instances or optimizing your application's performance.

## Amazon SNS - Streamlining Notifications and Communication

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688324774997/45d26a13-73f0-4dae-9bc6-4596fca32958.png align="center")

**Amazon SNS** (Simple Notification Service) is a fully managed messaging service that simplifies the process of building a notification system. With SNS, we can send messages to a variety of endpoints, including **email**, **SMS**, **mobile push notifications**, and more. It provides a **flexible** and **scalable** way to distribute notifications to multiple subscribers simultaneously. By leveraging SNS, we can streamline our communication channels, ensuring that **important alerts** and **updates** reach the right recipients at the right time.

## Task 1: Creating a CloudWatch Alarm for Billing Monitoring

To create a CloudWatch alarm for billing monitoring and receive an email notification when the billing amount reaches a certain threshold, follow these steps:

1. Open the Amazon CloudWatch console.
    
2. In the navigation pane, click on "Alarms" and then click on the "Create alarm" button.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688495658777/acf28ebf-b40a-48c4-96aa-b1d752c8dc2d.jpeg align="center")
    
3. Under the "Create Alarm" wizard, select the metric for billing by clicking on the "Select metric" button.
    
4. In the "CloudWatch metrics by category" section, expand the "Billing" category and choose the desired metric, such as "EstimatedCharges" or "TotalEstimatedCharges".
    
5. Configure the threshold for the alarm. Specify the threshold value at which you want to be notified, for example, $2.
    
6. Choose the "Static" or "Anomaly detection" option for setting up the threshold.
    
7. Configure the actions for the alarm. Select the "Create new list" option and choose "Send notification to an SNS topic".
    
8. Click on the "Create new topic" button and provide a name for the topic.
    
9. Enter your email address in the "Endpoint" field to receive email notifications.
    
10. Review the alarm configuration and click on the "Create alarm" button to create the CloudWatch alarm.
    

Once the alarm is created, you will receive email notifications whenever the billing amount reaches or exceeds the specified threshold. You can customize the alarm settings, such as the period, evaluation period, and additional actions, to meet your specific requirements.

Congratulations! You have successfully set up a CloudWatch alarm to monitor your AWS billing and configured an SNS topic to receive email notifications. Stay tuned for Day 47, where we will put our AWS knowledge to the test with a new hands-on lab.