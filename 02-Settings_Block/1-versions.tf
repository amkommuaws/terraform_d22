# Terraform block or Terraform Settings block
terraform {
  # required_version it foucses on the underlying terraform CLI installed in your laptop/server
  # If the version mentioned here and the version on your laptop doesnot match terraform will through a error
  # Everytime the required_version should be specified under terraform block 
  
  #required_version = "1.5.5" 
   # Constraint ~> 
   required_version = "~> 1.5.5" # Most Commonly Used
   # Allows only the rightmost version component to increment

   # Required Providers
   required_providers {
     aws = { # local provider name
        source = "hashicorp/aws" # https://registry.terraform.io/hashicorp/aws
        version = "~> 5.32.1" # Version of the Provider
        #Docker *** nginx
        # docker.io/nginx
        # gcr.io/nginx
        # devopswitcloud/nginx
        #source address
        # version constraint.
     }

   }
}

provider "aws" {
  # Extra Details 
  region = "us-east-1"
  # Will be giving the credentials
  # Static credentials +++++ never should be using this way
  # Never ever commit your access_key and secret_key in ansy SCM(github)
  access_key = "*****"
  secret_key = "******"
}


# Resource Block
# Create a AWS VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "myvpc"
  }
}