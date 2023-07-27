#  #90DaysOfDevOps Challenge - Day 73 - Grafana Setup

Welcome back to the #90DaysOfDevOps Challenge! On Day 73, we'll guide you through setting up Grafana in your local environment on an AWS EC2 instance. Grafana is a powerful tool for monitoring and visualization, and having it locally installed can be highly beneficial for development and testing purposes. Let's get started with the setup!

## Task 1: Setup Grafana in Your Local Environment on AWS EC2

We'll follow the steps outlined in the [Official Grafana Documentation](https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/)

### Step 1: Launch an AWS EC2 Instance

1. Log in to your AWS Management Console.
    
2. Navigate to the EC2 service.
    
3. Click on "Launch Instance" to create a new instance.
    
4. Select an appropriate Amazon Machine Image (AMI) for your EC2 instance. Choose an image that supports Grafana, like Amazon Linux or Ubuntu.
    
5. Choose an instance type based on your requirements.
    
6. Configure instance details such as the VPC, subnet, security group, and any other necessary settings.
    
7. Add storage if needed, and configure tags and security settings as per your requirements.
    
8. Review and launch the instance.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045020261/37543ff2-edab-48d3-8ee2-5719c3cf10dd.jpeg)
    

### Step 2: Connect to Your EC2 Instance

1. Once the instance is launched, select it from the EC2 dashboard.
    
2. Click on "Connect" to get connection instructions.
    
3. Follow the instructions to connect to your instance using your preferred method.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045109357/742faa5b-b7f7-40dd-99e7-1b1f2a6247f4.jpeg)
    

### Step 3: Install Grafana

Complete the following steps to install Grafana from the APT repository:

1. To install the required packages and download the Grafana repository signing key, run the following commands:
    
    ```bash
    sudo apt-get install -y apt-transport-https
    sudo apt-get install -y software-properties-common wget
    sudo wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key
    ```
    
2. To add a repository for stable releases, run the following command:
    
    ```bash
    echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
    ```
    
3. To add a repository for beta releases, run the following command:
    
    ```bash
    echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
    ```
    
4. Run the following command to update the list of available packages:
    
    ```bash
    # Updates the list of available packages
    sudo apt-get update
    ```
    
5. To install Grafana OSS, run the following command:
    
    ```bash
    # Installs the latest OSS release:
    sudo apt-get install grafana
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045606484/8fbe2809-44f0-49ef-8515-ab6b17f14a5d.jpeg)
    

### Step 4: Start and Enable Grafana Service

1. Start the Grafana service:
    
    ```bash
    sudo systemctl start grafana-server
    ```
    
2. Enable the Grafana service to start on boot:
    
    ```bash
    sudo systemctl enable grafana-server
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045662746/106b8b1a-0a9e-4111-833f-986908e51786.jpeg)
    

### Step 5: Access Grafana Web Interface

1. By default, Grafana listens on port 3000. Open port 3000 in the security group associated with your EC2 instance to allow incoming traffic.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045722589/c83f6fd1-37c6-4dae-83ad-021cd7c91179.jpeg)
    
2. Open your web browser and access Grafana using your EC2 instance's public IP address or DNS name, followed by port 3000 (e.g., [http://your-ec2-public-ip:3000](http://your-ec2-public-ip:3000)).
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045749562/08349e72-9d11-450e-8abd-16ac679513ab.jpeg)
    

### Step 6: Log in to Grafana

1. On the sign-in page, enter `admin` for username and password.
    
2. The first time you access Grafana, you will be prompted to set up an admin password.
    
3. Set your admin password and log in with the default username "admin" and the password you just set.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045924409/1f9c53e6-b161-4a4a-a3fe-766037fa5239.jpeg)
    

### Step 7: Explore Grafana

1. Once you log in, you will be directed to the Grafana dashboard.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690045966196/f255733a-f420-4cdb-b274-91ec96ed8d1c.jpeg)
    
2. Explore the Grafana interface and start creating your own dashboards to visualize and monitor data from various data sources.
    

Congratulations! You've successfully set up Grafana in your local environment on an AWS EC2 instance. Now, you can leverage Grafana's powerful visualization capabilities to monitor and analyze your data efficiently.

Stay tuned for Day 74 of the #90daysofdevops challenge, where we'll learn how to connect EC2 Instances with Grafana.

---