# Create a Key-Pair locally
resource "aws_key_pair" "ssh-key" {
  key_name = "boutique-key"
  public_key = var.public_key_data
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCy/OZzbwnnyr/lzEgyuitg/Oaspiw6TL8l2FXlbr9Y+XoVtvKo0OQcsRfl9+ARrxMJ1mvd/uJINI1pUs9PMS2B44Gu0y8Ejh1gkl9fHKWi5vb8eZXPt4NCS/E6N5F6tmRODvilYrDmgWPh47C2vioHUW4uh2v3cO70DWIST/W4Gc/mgWSjYVIe+1nD3HIBIdNZoXRn9qiR5kjPW6lzqJaRoHVqWR5IhEECGk/5D4HjRiHWhnUNDjv218WxbEcw4McCFdJIN6kxoPIlxgtIDGCmg+wlAOaUxEmTU/Sov6dxx0Z8FrkBUu8IkjDU/TS/ZdqWartm45SOe+AaPYEgkKAYqyugjMLDX5jYOnYtKV3orEpzQ1MsrhHN8w4Xqp5S5BUg5KdMuk/BueBHCCfXJYFq61++CsIqR83IG2Ar02EEaUiLfsStIZmHNQh1XH6eaahtsDYo28J/mhL9Q+f71J0EHeqCyzSlhHxq9yNkOljlIO1J8HglBNqh/cv74dG0uKk= devopswithcloud@Sivas-MacBook-Air.local"
  #public_key = file("~/.ssh/id_rsa.pub")
}

# Lets Create a EC2 Instance
resource "aws_instance" "tf-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.tf-prod-pub-subent-1.id #resource.resource_local_name.id
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  tags = {
    Name = "${var.env_prefix}-docker"
  }
  key_name = aws_key_pair.ssh-key.key_name
  # File Function
  user_data = file("entry.sh")
}




