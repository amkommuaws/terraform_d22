# Lets Create Elastic IP
resource "aws_eip" "tf-vpc-eip" {
  instance = aws_instance.tf-ec2.id
  # Now, we want to have meta argument implemented here
  # Elastic Ip, should be created only after the IGW has created
  # Will use depends_on meta argument
  depends_on = [ 
    aws_internet_gateway.tf-vpc-igw
   ]
}

# We need to use depends_on only as the last option. 
# Its not recommended to use multiple depends_on in your terraform manifest files.data 
# Still if you are using depends_on, make sure the documentation in your manifest files are clear, so that next person will not be having any ambiquety 
