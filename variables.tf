
variable "region" {
  default = "eu-west-2"
}

variable "aws_state_bucket" {
  default = "day4-ex1-ecs-cluster"
}

variable "aws_state_bucket_key" {
  default = "ecs-cluster.tfstate"
}


variable "aws_key" {}

variable "aws_secret" {}

variable "environment" {
  default = "DevOpsOct2018Tng"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "private_cidrs" {
  type = "list"
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "public_cidrs" {
  type = "list"
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones" {
  type = "list"
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "aws_aim" {
  default = "ami-0cb31bf24b130a0f9"
}
