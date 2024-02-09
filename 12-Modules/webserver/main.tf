
# Create a Security Groups

resource "aws_security_group" "tf-sg" {
  name = "i27-${var.env_prefix}-sg"
  description = "Will Allow SSH, HTTP traffic from the internet"
  vpc_id = var.vpc_id
    ingress {
        description = "Allow SSH from Internet"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp" #optional 
        cidr_blocks = [var.public_ip]
    }
  ingress {
    description = "Allow http port from internet"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.public_ip]
  }
  ingress {
    description = "Allow port 8080 from the internet"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.public_ip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_ip]
  }
  tags = {
    "Name" = "i27-${var.env_prefix}-sg"
  }

}


# Create a Key-Pair locally
resource "aws_key_pair" "ssh-key" {
  key_name = "boutique-key-${terraform.workspace}"
  #public_key = file("id_rsa.pub")
  public_key = var.public_key_data
}

# Lets Create a EC2 Instance
resource "aws_instance" "tf-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  # default , instance 2
  # non-default, instance 1
  # condition based instance count
  #count = terraform.workspace == "default" ? 2 : 1
  subnet_id = var.subnet_id
  #subnet_id = aws_subnet.tf-prod-pub-subent-1.id #resource.resource_local_name.id
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  tags = {
    Name = "${terraform.workspace}-provisioner" 
  }
  key_name = aws_key_pair.ssh-key.key_name
  #user_data = file("entry.sh")

}





