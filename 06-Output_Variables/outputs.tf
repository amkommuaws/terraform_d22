# This file will populates output values for the resources we created 

output "op_public_ip" {
    description = "Public Ip for the EC2 Webserver we are creating"
    value = aws_instance.tf-ec2.public_ip
}

# Security Groups assigned to the Ec2 machine
output "op_security_group" {
    value = aws_instance.tf-ec2.security_groups
}

# Along with public ips, we generally get DNS names

output "op_public_dns" {
    description = "DNS for the EC2 webserver created"
    value = "http://${aws_instance.tf-ec2.public_dns}"
    #http://dnsname
}