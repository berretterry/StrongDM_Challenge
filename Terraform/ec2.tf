###Web Server
resource "aws_instance" "web_server" {
  instance_type = t2.micro
  ami = ami-04a81a99f5ec58529
  subnet_id = aws_subnet.web_tier_subnet.id
  security_groups = [aws_security_group.ssh_sg]
  key_name = aws_key_pair.ssh.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "WebTier Instance"
  }
}


###App Server
resource "aws_instance" "app_server" {
  instance_type = t2.micro
  ami = ami-04a81a99f5ec58529
  subnet_id = aws_subnet.app_tier_subnet.id
  security_groups = [aws_security_group.ssh_sg]
  key_name = aws_key_pair.ssh.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "WebTier Instance"
  }
}
###StrongDM Gateway
resource "aws_instance" "app_server" {
  instance_type = t2.medium
  ami = ami-00ec582aa9f5c591f
  subnet_id = aws_subnet.web_tier_subnet
  security_groups = [aws_security_group.ssh_sg]
  key_name = aws_key_pair.ssh.key_name
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = "10"
  }
  tags = {
    "Name" = "WebTier Instance"
  }
  user_data = file("${path.module}/userdata/sdm_userdata.sh")
}

