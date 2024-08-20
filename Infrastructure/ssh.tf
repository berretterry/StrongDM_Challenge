###Create ssh key

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name = "sdm_public_key"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_file" "access_key" {
  content = tls_private_key.ssh.public_key_openssh
  filename = "access_key.pem"
}

