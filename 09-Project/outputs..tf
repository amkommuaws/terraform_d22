output "public_ip_vm" {
  value = aws_instance.tf-ec2.public_ip
}