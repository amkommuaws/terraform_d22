# These variable might be defined by your resource or by the module you imported. 
# below is the varible we defined in main.tf
variable vpc_cidr_block {}

# below variable are expected in the module
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "public_ip" {}
variable "env_prefix" {}
variable "public_key_data" {}
variable "ami_id" {}
variable "instance_type" {}