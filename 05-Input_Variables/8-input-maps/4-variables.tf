
variable "region" { # this is a user friendly name
  description = "This is the region where my resources will be created"
  default = "us-east-1" #Default value for the variable region
  type = string
}

# Variable for Instance Type
variable "instance_type" {
  description = "Instance type used in the EC2 machine"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "test" = "t2.small"
    "prod" = "t3.small"
  }
  #type=list(string)
  # default = "t2.micro"
  #default = [ "t2.micro", "t2.small", "t3.micro" ]
}

# Instance Tags
variable "instance_tags" {
  description = "These are instance tags"
  type = map(string)
  default = {
    "Name" = "Tomcat Server"
    "Owner" = "Siva"
  }
}

# Instance Count
variable "instance_count" {
  description = "How many instances should be created"
  default = 1
  type = number
}

# AMI ID
variable "ami_id" {
  description = "AMI ID for my EC2 machine"
  default = "ami-0005e0cfe09cc9050"
  type = string
}

# Instance Name 
variable "instance_name" {
  description = "Instance Name"
  type = string
  default = "default"
}





