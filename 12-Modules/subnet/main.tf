# This is a module used to create subnets , security group and any other n.w related resources.
# Create a Subnet Resource

resource "aws_subnet" "tf-prod-pub-subent-1" {
  vpc_id = var.vpc_id
  #vpc_id = aws_vpc.tf-vpc.id
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
    vpc_id = var.vpc_id
  #vpc_id = aws_vpc.tf-vpc.id
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
  default_route_table_id = var.default_route_table_id
  #default_route_table_id = aws_vpc.tf-vpc.default_route_table_id
  route {
    cidr_block = var.public_ip
    gateway_id = aws_internet_gateway.tf-vpc-igw.id
  }
  tags = {
    "Name" = "${var.env_prefix}-main-rtb"
  }
}

