
# Lets Create a EC2 Instance
resource "aws_instance" "tf-ec2" {
  #count = 1
  count = var.instance_count
  ami           = "ami-0005e0cfe09cc9050"
  #instance_type = "t2.micro"
  #instance_type = var.instance_type
  instance_type = var.instance_type[1]
  vpc_security_group_ids = [
    aws_security_group.tf-sg-allow-ssh.id,
    aws_security_group.tf-sg-allow-http-https.id
    ]
  tags = {
    Name = "${var.instance_name}-${count.index}"
  } 
  key_name = "newdevops"
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




