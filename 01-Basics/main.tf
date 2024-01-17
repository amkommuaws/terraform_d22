# Provider Block
# key = value
# Validate ====> key , terraform 
provider "aws" {
  region = "us-east-1"
}

# Old representation
provider "google" {
  region = "us-central1"
}


# Manager asked me to create a EC2 machine in AWS
# Resource block
resource "aws_instance" "tfnew" {
  ami = "ami-083327d0fe6d65178"
  instance_type = "t2.micro"
}

# HCL 

