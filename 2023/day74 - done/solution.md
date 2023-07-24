# #90DaysOfDevOps Challenge - Day 74 - Connecting EC2 with Grafana

Welcome to Day 74 of the #90DaysOfDevOps Challenge. Today, we will explore how to connect Linux and Windows EC2 instances with Grafana, enabling us to monitor various components of the servers. We'll use Grafana, Prometheus, and Node Exporter to achieve this. So, let's dive in!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690134727836/0bdbae6a-26d7-4120-9c7d-8b0a34fef37b.webp align="center")

## Grafana: A Powerful Monitoring Tool

Grafana is not just an ordinary monitoring system; it is a feature-rich and highly versatile platform that empowers DevOps engineers to gain deep insights into the performance and health of their systems. With its intuitive and user-friendly interface, Grafana allows you to collect and visualize metrics from various sources effortlessly. Whether you need to monitor server metrics, application performance, or business analytics, Grafana has got you covered.

## Prometheus: The Data Scraping Wizard

Prometheus is an exceptional open-source monitoring and alerting toolkit that specializes in handling time-series data like no other. With its unique pull model architecture, Prometheus can seamlessly scrape metrics from a wide range of targets, including the Node Exporter running on our EC2 instances. Its ability to scale and handle massive amounts of data while maintaining exceptional performance sets it apart as a true data scraping wizard.

## Node Exporter: Metrics for Our EC2 Instances

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690205965915/2cd146a4-178a-4ad1-9efc-6b6d4372373f.jpeg align="center")

Node Exporter acts as a dedicated Prometheus exporter, gathering crucial system-level metrics from our Linux EC2 instances. This powerful tool enables us to capture essential performance indicators such as CPU usage, memory consumption, disk space utilization, and network statistics. By harnessing Node Exporter's capabilities, we can comprehensively monitor the health and resource utilization of our EC2 instances, ensuring they operate at peak efficiency and performance levels.

## Task: Connecting EC2 Instances with Grafana

Now that we have a brief overview of the tools we'll be using, let's go ahead and connect our Linux EC2 instances with Grafana. We'll follow these steps:

* **Install Grafana and Prometheus on an EC2 Instance**:
    
    * Launch a new EC2 instance with Ubuntu or any other supported Linux distribution.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690207107367/d5276547-bf1a-4878-809e-bd088b7ed0fb.jpeg align="center")
        
    * Use the below shell scrip to install docker and ensure you can follow the next steps. This is applicable to all the instances we'll use today.
        
        ```bash
        #!/bin/bash
        
        # Update package lists
        sudo apt update
        
        # Install required packages to use repositories over HTTPS
        sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
        
        # Add Docker repository GPG key
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        
        # Add Docker repository
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        
        # Update package lists again with the Docker repository
        sudo apt update
        
        # Install Docker
        sudo apt install -y docker-ce docker-ce-cli containerd.io
        
        # Start Docker
        sudo systemctl start docker
        
        # Enable Docker to start on boot
        sudo systemctl enable docker
        
        # Add $USER to the docker group
        sudo usermod -aG docker $USER
        
        # Restart system to apply the changes
        sudo reboot
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690207394837/d0b5fa2b-45bc-4f93-8edd-ff308e953607.jpeg align="center")
        
    * SSH into the EC2 instance and install Grafana using the [Official Documentation](https://grafana.com/docs/grafana/latest/setup-grafana/installation/) for your OS. In my case, I will use Docker Compose. I'll also follow the [Prometheus Official Documentation](https://prometheus.io/docs/prometheus/latest/installation/) to instal
        
        ```yaml
        ---
        version: '3'
        volumes:
          prometheus-data:
            driver: local
          grafana-data:
            driver: local
        
        services:
        
          grafana:
            image: grafana/grafana-oss:latest
            container_name: grafana
            ports:
              - "3000:3000"
            volumes:
              - grafana-data:/var/lib/grafana
            restart: unless-stopped
        
          prometheus:
            image: prom/prometheus:latest
            container_name: prometheus
            ports:
              - 9090:9090
            volumes:
              - /etc/prometheus:/etc/prometheus
              - prometheus-data:/prometheus
            command: "--config.file=/etc/prometheus/prometheus.yml"
            restart: unless-stopped
        ```
        
    * Run `docker compose up -d` to start the services
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690207822450/5e41b22d-ee9e-4000-85da-fe0dad601aa4.jpeg align="center")
        
* **Install Node Exporter**:
    
    * On the same Linux EC2 instance (Instance-A), install Node Exporter to collect system-level metrics. For that, I'll amend the previous docker-compose.yml file with the below changes to include the node exporter container:
        
        ```yaml
        ---
        version: '3'
        volumes:
          prometheus-data:
            driver: local
          grafana-data:
            driver: local
        
        services:
        
          grafana:
            image: grafana/grafana-oss:latest
            container_name: grafana
            ports:
              - "3000:3000"
            volumes:
              - grafana-data:/var/lib/grafana
            restart: unless-stopped
        
          prometheus:
            image: prom/prometheus:latest
            container_name: prometheus
            ports:
              - 9090:9090
            volumes:
              - /etc/prometheus:/etc/prometheus
              - prometheus-data:/prometheus
            command: "--config.file=/etc/prometheus/prometheus.yml"
            restart: unless-stopped
        
          node_exporter:
            image: quay.io/prometheus/node-exporter:latest
            container_name: node_exporter
            command:
              - '--path.rootfs=/host'
            network_mode: host
            pid: host
            restart: unless-stopped
            volumes:
              - '/:/host:ro,rslave'
        ```
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690210132167/5a4481e4-cd6e-4f23-9220-061e5393a10a.jpeg align="center")
        
    * Launch another Linux EC2 instance (Instance-B) and use the below docker-compose.yml file to run node exporter.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690208066612/b3dc79eb-13f2-47be-b317-8cf5d38fa155.jpeg align="center")
        
        ```yaml
        ---
        version: '3'
        
        services:
        
          node_exporter:
            image: quay.io/prometheus/node-exporter:latest
            container_name: node_exporter
            command:
              - '--path.rootfs=/host'
            network_mode: host
            pid: host
            restart: unless-stopped
            volumes:
              - '/:/host:ro,rslave'
        ```
        
    * Run `docker-compose up -d` and `docker ps` to ensure the Docker container is running
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690209331542/f0a0baec-9858-40a5-88a8-fc1189c0d249.jpeg align="center")
        
* **Configure Prometheus to Scrape Metrics**:
    
    * On Instance-A, edit the Prometheus configuration file `prometheus.yml` to include the scraping targets for both Node Exporter instances (Instance-A and Instance-B) and save it in `/etc/prometheus` (create the directory if necessary).
        
        ```yaml
        global:
          scrape_interval:     15s # By default, scrape targets every 15 seconds.
        
          # Attach these labels to any time series or alerts when communicating with
          # external systems (federation, remote storage, Alertmanager).
          # external_labels:
          #  monitor: 'codelab-monitor'
        
        # A scrape configuration containing exactly one endpoint to scrape:
        # Here it's Prometheus itself.
        scrape_configs:
          # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
          - job_name: 'prometheus'
            # Override the global default and scrape targets from this job every 5 seconds.
            scrape_interval: 5s
            static_configs:
              - targets: ['172.31.0.36:9090']
        
          # Example job for node_exporter
          - job_name: 'node_exporter'
            static_configs:
              - targets: ['172.31.0.58:9100', '172.31.0.36:9100']
        
          # Example job for cadvisor
          # - job_name: 'cadvisor'
          #   static_configs:
          #     - targets: ['cadvisor:8080']
        ```
        
    * Restart the Prometheus service to apply the changes.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690209432701/31ae69e3-cc32-4aa0-9734-532149ad5559.jpeg align="center")
        
    * Copy the public IP address of the instance where Prometheus is installed and paste is into the browser using the port 9090 to verify Prometheus can connect to the target nodes.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690209884984/2c3567d6-6ae9-4a46-b98e-af16a09e2cb1.jpeg align="center")
        
    
* **Create a Grafana Dashboard**:
    
    * Access the Grafana web interface by opening your browser and entering the public IP or DNS of the Grafana EC2 instance and the port 3000
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690209512282/0e69dcf3-29d9-42d8-9a7b-beec96cbbf4d.jpeg align="center")
        
    * Log in to Grafana using the default credentials (admin:admin) and change the password.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690210056239/d7749edd-fdc6-4c2a-816a-12fa9413b16e.jpeg align="center")
        
    * Add Prometheus as a data source in Grafana, using the Prometheus EC2 instance's IP address.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690209929873/81ec64be-f916-456e-855a-6b1d26059f8e.jpeg align="center")
        
    * Create a new dashboard in Grafana and add panels to visualize different metrics collected by Node Exporter.
        
        ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690210038203/36755ee2-7fe9-4350-a954-6e2d80842b55.jpeg align="center")
        

Congratulations! You've successfully connected Linux EC2 instances with Grafana and created a dashboard to monitor their performance metrics. Monitoring is a crucial aspect of any DevOps practice, and Grafana along with Prometheus and Node Exporter provides a powerful combination to gain insights into the health of your infrastructure.

Stay tuned for the Day 75, where we'll explore how to send Docker logs to Grafana!