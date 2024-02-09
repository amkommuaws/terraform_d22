# Create a VPC resource 
resource "aws_vpc" "tf-vpc" {
  // resource arguments
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${terraform.workspace}-vpc"
  }
}


# Importing a module
module "myapp-subnet" { 
  source = "./subnet"
  vpc_id = aws_vpc.tf-vpc.id
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  default_route_table_id = aws_vpc.tf-vpc.default_route_table_id
  env_prefix = var.env_prefix
  public_ip = var.public_ip
}

# Importing a Webserver Module 
module "myapp-webserever" {
  source = "./webserver"
  vpc_id = aws_vpc.tf-vpc.id
  public_ip = var.public_ip
  public_key_data = var.public_key_data
  ami_id  = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.myapp-subnet.subnet.id
  env_prefix =var.env_prefix
}


