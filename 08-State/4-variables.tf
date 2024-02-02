# Defining the variables 
# x = 10,11

variable "region" { # this is a user friendly name
  description = "This is the region where my resources will be created"
  default = "us-east-1" #Default value for the variable region
  type = string
}

# Variable for Instance Type
variable "instance_type" {
  description = "Instance type used in the EC2 machine"
  default = "t2.micro"
  type = string
}

# Instance Count
variable "instance_count" {
  description = "How many instances should be created"
  default = 1 
  type = number
}
