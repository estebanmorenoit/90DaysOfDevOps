# #90DaysOfDevOps Challenge - Day 77 - Grafana Cloud Alerting

Welcome back to the #90DaysOfDevOps Challenge. On Day 77, we'll explore the powerful world of Grafana Cloud alerting. Grafana Alerting allows you to proactively detect and respond to issues in your systems, ensuring you can identify and resolve problems quickly. Let's learn how to set up Grafana Cloud and create sample alerting rules step by step!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690282065822/a88a70d1-c5d6-4701-865e-b3095ec22a05.png align="center")

## Grafana Cloud: Simplified and Scalable Monitoring

Grafana Cloud is a comprehensive and managed observability platform offered by Grafana Labs. It brings together a suite of tools, including Grafana for visualization, Prometheus for monitoring, and Loki for log aggregation, into a unified and fully managed solution. With Grafana Cloud, teams can effortlessly set up, maintain, and scale their monitoring infrastructure, freeing up valuable time and resources for other critical tasks.

## Grafana Alerting: Stay Informed, Act Swiftly

Grafana Alerting is an integral part of Grafana Cloud, enabling us to proactively monitor our systems and respond to anomalies and incidents in real time. With Grafana Alerting, we can define alert rules based on specific thresholds or conditions, and receive instant notifications via various channels like email, Slack, PagerDuty, or custom webhooks when those rules are triggered.

### Key Features of Grafana Alerting:

1. **Rule-based Alerts**: We can create rules using PromQL (Prometheus Query Language) expressions to evaluate metrics data and define alert conditions.
    
2. **Multiple Notification Channels**: Grafana supports a wide range of notification channels, allowing us to receive alerts in the most convenient and timely manner.
    
3. **Silencing and Muting**: We can silence or mute specific alerts during maintenance or known incidents to avoid unnecessary noise.
    
4. **Alert History and Tracking**: Grafana maintains a history of triggered alerts, giving us insights into past incidents and their resolutions.
    
5. **Dashboard Integration**: We can visualize alerts directly on Grafana dashboards, providing a holistic view of our system's health.
    

## Task: Setup Grafana Cloud and Sample Alerting

### Step 1: Setup Grafana Cloud Account

1. Navigate to the Grafana Cloud website ([https://grafana.com/cloud/](https://grafana.com/cloud/)) and sign up for an account.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690287518754/6fabefcf-ed0e-42f0-aad3-2868ac7a9c1d.jpeg align="center")
    
2. Follow the on-screen instructions to set up your Grafana Cloud account, including providing the necessary details and configuring preferences.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690287546762/fa06f0b4-9006-4dbe-a1a6-694343d442dc.jpeg align="center")
    
3. Scroll down until you see the Prometheus option and hit the 'Send Metrics' button.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690287879315/89905af6-787f-4c1b-92d2-fbb70adc5ea4.jpeg align="center")
    
4. Follow the instructions on the screen to integrate your Prometheus Server with Grafana Cloud.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690287936300/03771ae3-594b-4b07-9b53-3445fbacb6e7.jpeg align="center")
    
5. You will have to add the `remote_write` module to your existing `prometheus.yml` config file.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690291055832/82e380ce-fd01-424c-8a9e-4b5043a7d4fe.jpeg align="center")
    
6. Once this is set up, we can import our preferred Grafana dashboard or create our own one and start monitoring our infrastructure.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690291474636/c47d133d-ad72-4d4a-8064-5fcdcc96e4ab.jpeg align="center")
    

### Step 2: Setup Sample Alerting

This step will be completed in Grafana OSS.

1. Log in to your Grafana dashboard.
    
2. Click on "Alerting" in the left-hand sidebar to access the Alerting configuration.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690291971706/e6f80713-95ad-4b68-bfd8-07d1e63978ca.jpeg align="center")
    
3. Click on "Create Rule" to set up a new alerting rule.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690291993362/6b8f2a8d-8fa3-43aa-bec5-0a74aa4986e7.jpeg align="center")
    
4. Define the conditions for the alerting rule based on your data and requirements. Once done, save the Alert Rule.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690298922003/b3b23813-43aa-48e7-88c8-f4033fa5e291.jpeg align="center")
    
5. Select Contact Points to specify the notification channels, such as email, Slack, or other integrations, where alerts will be sent when triggered. In this case, I will use Slack. You can follow the steps from the [Slack Official Documentation](https://api.slack.com/messaging/webhooks) to send messages using Incoming Webhooks.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690298636305/ef19e736-33c1-4897-bdff-758e35658d87.jpeg align="center")
    
6. Our alert is now in a normal state as the CPU usage is not higher than 2% at the moment.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690299017229/3c7b9b1f-b13e-4f6a-b798-1c9ce0b652d6.jpeg align="center")
    
7. Let's stress our system using the below commands and see if the alerting system works as expected.
    
    ```bash
    sudo apt install stress
    stress --cpu 4
    ```
    
8. We can see how our alert rule is now on 'Firing' mode and has triggered and slack alert.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690299216570/3d50c528-d92d-4296-997d-1c46b1fc313e.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690299235077/ac73c3a2-5f63-4fcb-ae13-14c7edc29c2c.jpeg align="center")
    
9. As soon as we stop the stress test, the system will resolve the alert and notify us via Slack.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690299315298/b4a0b0d4-3213-4538-a290-63cd613ed77d.jpeg align="center")
    

Congratulations! You've now set up Grafana Cloud and created sample alerting rules to proactively monitor your systems and respond to potential issues in real time. Grafana Cloud Alerting equips you with a powerful tool to stay ahead of system problems and ensure smooth operations.

Stay tuned for Day 78 of the #90daysofdevops challenge, where we'll continue exploring monitoring and alerting with Grafana.