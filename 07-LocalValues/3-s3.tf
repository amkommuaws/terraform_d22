# Create a bucket 


# Define Local Values
locals {
    # variable definition
    bucket-name = "${var.env_name}-${var.app_name}-bucket"
}


resource "aws_s3_bucket" "mys3bucket" {
    #bucket = "my-tf-test-bucket" # Bucket name shoule be unique
    bucket = local.bucket-name
    tags = {
        Name        = local.bucket-name
        Environment = var.env_name
    }
}

# gcp, aws, random