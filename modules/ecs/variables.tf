
variable "environment" {}

variable "cidr" {}

variable "min_size" {
  default = 2
}

variable "max_size" {
  default = 2
}

variable "desired_capacity" {
  default = 2
}

variable "private_cidrs" {
  type = "list"
}

variable "public_cidrs" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}

variable "aws_aim" {
  default = "ami-066826c6a40879d75"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {}


variable "load_balancers" {
  type = "list"
  default = []
}

variable "instance_group" {
  default = "hello"
}
