# Lets Create a EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
  tags = {
    Name = "WebServer-1"
  } # Webserver-0, webserver-1
  # count = 0
  key_name = "newdevops"
  lifecycle {
    create_before_destroy = true
  }
}


# Lets Create a Other Tomcat Instance
resource "aws_instance" "web1" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
  tags = {
    Name = "AppServer"
  } # Webserver-0, webserver-1
  # count = 0
  key_name = "newdevops"

}




