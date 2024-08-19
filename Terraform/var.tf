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

variable "mysql_username" {
  default = "admin"
}

variable "mysql_pass" {
  default = "password"
}

variable "SDM_API_ACCESS_KEY" {
  type = string
}

variable "SDM_API_SECRET_KEY" {
  type = string
}