
variable "region" {
  default = "eu-west-1"
}

variable "aws_state_bucket" {
  default = "day4-ex1-ecs-cluster"
}

variable "aws_state_bucket_key" {
  default = "ecs-cluster.tfstate"
}


variable "aws_key" {}

variable "aws_secret" {}
