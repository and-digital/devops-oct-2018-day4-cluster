
variable "aws_ami" {}

variable "instance_type" {}

variable "availability_zones" {}

variable "key_name" {}

variable "environment" {}

variable "cidr" {}

variable "min_size" {}

variable "max_size" {}

variable "desired_capacity" {}

variable "private_cidrs" {
  type = "list"
}

variable "instance_group" {
  default = "test"
}

variable "load_balancers" {
  type = "list"
}

variable "vpc_id" {}
