### Creating Security Group for SSH
resource "aws_security_group" "ssh_sg" {
  name        = "ssh_sg"
  description = "SSH Security Group"
  vpc_id      = aws_vpc.sdm_challenge_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ssh_sg.id
  cidr_ipv4 = ["0.0.0.0/0"]
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

### Creating SDM GW Security Group
resource "aws_security_group" "sdmgw_sg" {
  name = "sdmgw_sg"
  description = "StrongDM Gateway Security Group"
  vpc_id = aws_vpc.sdm_challenge_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sdm gw sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sdmgw_ssh" {
  security_group_id = aws_security_group.sdmgw_sg.id
  cidr_ipv4 = ["0.0.0.0/0"]
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "sdmgw_port" {
  security_group_id = aws_security_group.ssh_sg.id
  cidr_ipv4 = ["0.0.0.0/0"]
  from_port = 5000
  ip_protocol = "tcp"
  to_port = 5000
}

### Creating Security Group for Data Tier
resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Database Security Group"
  vpc_id      = aws_vpc.sdm_challenge_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db_app" {
 security_group_id = aws_security_group.db_sg.id
 cidr_ipv4 = var.app_cidr_block
 from_port = 3306
 ip_protocol = "tcp"
 to_port = 3306
}

# resource "aws_vpc_security_group_ingress_rule" "db_ssh" {
#   security_group_id = aws_security_group.db_sg.id
#   cidr_ipv4 = var.vpc_cidr
#   from_port = 22
#   ip_protocol = "tcp"
#   to_port = 22
# }
