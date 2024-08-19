output "ssh_private_key_pem" {
  value = tls_private_key.ssh.private_key_pem
}

output "ssh_public_key_pem" {
  value = tls_private_key.ssh.public_key_pem
}

output "nat_gateway_ip" {
  value = aws_eip.nat_eip.public_ip
}

output "app_private_ip" {
  value = aws_instance.app_server.private_ip
}

output "web_private_ip" {
  value = aws_instance.web_server.private_ip
}

output "sdmgw_private_ip" {
  value = aws_instance.web_server.public_ip
}

