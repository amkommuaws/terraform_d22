# Defining the variables 
# x = 10,11

variable "region" { # this is a user friendly name
  description = "This is the region where my resources will be created"
  default = "us-east-1" #Default value for the variable region
  type = string
}


variable "app_name" {
  description = "Application name"
  type = string
  default = "boutique-eureka"
}

variable "env_name" {
  description = "Environment name"
  type = string
  default = "dev"
}