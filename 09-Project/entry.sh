#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start 
sudo usermod -a -G docker ec2-user
sudo echo "Welcome to Nginx Container using Terraform" >> /tmp/index.html
sudo docker run -d -p 8080:80 nginx
sudo docker cp /tmp/index.html $(sudo docker ps -aq):/usr/share/nginx/html/index.html