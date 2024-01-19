# Create a VPC resource 
resource "aws_vpc" "tf-vpc" {
  // resource arguments
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "prod-vpc"
  }
}


# Create a Subnet Resource
resource "aws_subnet" "tf-prod-pub-subent-1" {
  vpc_id = aws_vpc.tf-vpc.id
  # before 0.11 version ${aws_vpc.tf-vpc.id}
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "prod-pub-subnet-1"
  }
  map_public_ip_on_launch = true # false ===> no need to doublequtoes
}

# Create IGW resource
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    "Name" = "prod-igw"
  }
}


# Create Route table 
resource "aws_route_table" "tf-vpc-public-rt" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    "Name" = "prod-rt"
  }
}

# Create a Route in the Route table for public connection
resource "aws_route" "tf-vpc-public-route" {
  route_table_id = aws_route_table.tf-vpc-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.tf-vpc-igw.id
}


# Associate Route table with subnets
resource "aws_route_table_association" "tf-vpc-public-rt-assoc" {
  route_table_id = aws_route_table.tf-vpc-public-rt.id
  subnet_id = aws_subnet.tf-prod-pub-subent-1.id
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
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    description = "Allow http port from internet"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "prod-vpc-sg"
  }

}
