#!/usr/bin/env bash

# Update package
sudo apt-get update && sudo apt-get upgrade -y

# Install Git
sudo apt-get install git -y

# Install SSM
sudo wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -y

# Install CloudWatch Agent
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm -y
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status

# Install AWS Inspector
curl -O https://inspector-agent.amazonaws.com/linux/latest/install
sudo bash install

# Install Docker
sudo apt-get install docker.io -y
sudo systemctl start docker

