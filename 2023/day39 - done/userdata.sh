#!/bin/bash

# Update the system packages
sudo yum update –y

# Download and configure the Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade the system packages
sudo yum upgrade

# Install Java 11 using Amazon Corretto
sudo dnf install java-11-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y

# Enable and start the Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Docker
sudo yum install -y docker

# Enable and start the Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Check the status of Jenkins service
sudo systemctl status jenkins

# Check the status of Docker service
sudo systemctl status docker
