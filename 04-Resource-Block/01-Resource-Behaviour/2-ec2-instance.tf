# I want to create a EC2 Resource
resource "aws_instance" "tf-my-ec2" {
  # Resource Arguments
  # Meta-Arguments
  ami = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  #availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "Web-Server"
    #"env" = "QA"
  }
  # It will pick up the default VPC
}