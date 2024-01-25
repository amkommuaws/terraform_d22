#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
sudo systemctl enable httpd
echo "<h1> Welcome to Meta Argument Class </h1>" > /var/www/html/index.html