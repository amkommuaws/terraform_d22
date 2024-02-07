terraform {
   required_version = "~> 1.5.5" # Most Commonly Used

   required_providers {
     aws = { # local provider name
        source = "hashicorp/aws" # https://registry.terraform.io/hashicorp/aws
        version = "~> 5.32.1" # Version of the Provider
     }

   }
}

# This provider is for us-east-1
provider "aws" {
  # Extra Details
  profile = "default" 
  region = "us-east-1"
}


