
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
  #default = 1
  type = number
}

# AMI ID
variable "ami_id" {
  description = "AMI ID for my EC2 machine"
  #default = "ami-0005e0cfe09cc9050"
  default = "mymiid-442343423432423"
  type = string
  validation {
    condition = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
    error_message = "You enterd an invalid AMI ID, ami id should start with ami-"
  }
}

# Instance Name 
variable "instance_name" {
  description = "Instance Name"
  type = string
  default = "default"
}





