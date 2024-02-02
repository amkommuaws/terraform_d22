
# Terraform settings block
terraform {
   required_version = "~> 1.5.5" # Most Commonly Used

   required_providers {
     aws = { # local provider name
        source = "hashicorp/aws" # https://registry.terraform.io/hashicorp/aws
        version = "~> 5.32.1" # Version of the Provider
     }

   }
   backend "s3" {
    bucket = "i27-devopsb2-tf"
    key = "data/terraform.tfstate"
    region = "us-east-1"

    # This is for state locking 
    dynamodb_table = "terraform-siva-state-table"
   }
}


# This provider is for us-east-1
provider "aws" {
  # Extra Details
  profile = "default" 
  #region = "us-east-1"
  region =  var.region # var.variablename
}


