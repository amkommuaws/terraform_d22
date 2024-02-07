
# Create a VPC resource 
resource "aws_vpc" "tf-vpc" {
  // resource arguments
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${var.env_prefix}-vpc"
  }
}


# Create a Subnet Resource
resource "aws_subnet" "tf-prod-pub-subent-1" {
  vpc_id = aws_vpc.tf-vpc.id
  # before 0.11 version ${aws_vpc.tf-vpc.id}
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    "Name" = "${var.env_prefix}-subnet-1"
  }
  map_public_ip_on_launch = true # false ===> no need to doublequtoes
}

# Create IGW resource
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    "Name" = "${var.env_prefix}-igw"
  }
}

/*
# Create Route table 
resource "aws_route_table" "tf-vpc-public-rt" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    "Name" = "${var.env_prefix}rt"
  }
}

# Create a Route in the Route table for public connection
resource "aws_route" "tf-vpc-public-route" {
  route_table_id = aws_route_table.tf-vpc-public-rt.id
  destination_cidr_block = var.public_ip
  gateway_id = aws_internet_gateway.tf-vpc-igw.id
}


# Associate Route table with subnets
resource "aws_route_table_association" "tf-vpc-public-rt-assoc" {
  route_table_id = aws_route_table.tf-vpc-public-rt.id
  subnet_id = aws_subnet.tf-prod-pub-subent-1.id
}
*/

# We can use the default Route table, instead of creating a new one.
resource "aws_default_route_table" "tf-main-rtb" {
  default_route_table_id = aws_vpc.tf-vpc.default_route_table_id
  route {
    cidr_block = var.public_ip
    gateway_id = aws_internet_gateway.tf-vpc-igw.id
  }
  tags = {
    "Name" = "${var.env_prefix}-main-rtb"
  }
}

# Create a Security Groups

resource "aws_security_group" "tf-sg" {
  name = "prod-vpc-sg"
  description = "Will Allow SSH, HTTP traffic from the internet"
  vpc_id = aws_vpc.tf-vpc.id
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
    "Name" = "${var.env_prefix}-vpc-sg"
  }

}
