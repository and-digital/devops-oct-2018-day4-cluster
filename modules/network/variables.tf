

variable "enviroment" {}

variable "cidr" {}

variable "private_cidrs" {
  type = "list"
}

variable "public_cidrs" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}

variable "destination_cidr_block" {
  default = "0.0.0.0/0"
}
