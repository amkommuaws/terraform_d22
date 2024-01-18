resource "aws_vpc" "tf-vpc-us-west-1" {
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "us-west-1-vpc"
  }
  provider = aws.aws-west-1 # This is called as a meta argument

  # provider = <PROVIDER>.<ALIAS> reference.
}