variable "aws_region" {
  type = string
  default = "us-west-2"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "app_subnet_cidr" {
  type = string
  default = "10.0.2.0/24"
}

variable "db_subnet_cidr" {
  type = string
  default = "10.0.3.0/24"
}

variable "web_instance_type" {
  type = string
  default = "t2.micro"
}

variable "app_instance_type" {
  type = string
  default = "t2.micro"
}
