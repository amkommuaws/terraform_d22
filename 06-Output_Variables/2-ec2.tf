
# Lets Create a EC2 Instance
resource "aws_instance" "tf-ec2" {
  #count = 1
  #count = var.instance_count
  ami           = "ami-0005e0cfe09cc9050"
  key_name = "newdevops"
  #instance_type = "t2.micro"
  instance_type = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.tf-sg-allow-ssh.id,
    aws_security_group.tf-sg-allow-http-https.id
    ]
  tags = {
    Name = "Webserver"
    Env = "Dev"
  } 

  # File Function
  #user_data = file("apache.sh")
  # Comments
  # Multi Line Comments
  user_data = <<-EOF
  #! /bin/bash
  sudo yum update -y
  sudo yum install httpd -y
  sudo service httpd start
  sudo systemctl enable httpd
  echo "<h1> Welcome to Meta Argument Class" > /var/www/html/index.html
  EOF
}




