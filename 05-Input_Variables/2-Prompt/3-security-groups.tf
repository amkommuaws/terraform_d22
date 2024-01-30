# Create a security group to allow port 22
# Create a Security Groups

resource "aws_security_group" "tf-sg-allow-ssh" {
  name = "allow_ssh"
  description = "Will Allow SSH from the Internets"
    ingress {
        description = "Allow SSH from Internet"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp" #optional 
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow_ssh"
  }

}


# Create Security Group to allow port 80,443
resource "aws_security_group" "tf-sg-allow-http-https" {
  name = "allow_http-https"
  description = "Allows traffic from the internet"
    ingress {
        description = "Allow http from Internet"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp" #optional 
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow https from Internet"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp" #optional 
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow_http-https"
  }
}