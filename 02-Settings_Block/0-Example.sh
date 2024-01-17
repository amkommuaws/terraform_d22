terraform {
    # I will mention terraform related configurations
    
    # Required Terraform Version
    required_version = "~> 1.5.5" # Version Constraint

    # Required Terraform Providers
    required_providers {
      aws = {
        version = ">= 4.1.2"
        source = "hashicorp/aws"
      }
    }

    # Remote backend for storing your terraform state configurations
    backend "s3" {
      bucket = "testbucket"
      region = "us-east-1"
    }

    # Experimental Features

    # Providers Metadata
}
