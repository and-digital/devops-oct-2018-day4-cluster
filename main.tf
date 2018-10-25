
module "vpc" {
  source = "modules/vpc"
  cidr = "${var.cidr}"
  enviroment = "${var.enviroment}"
}

module "private_subnet" {
  source = "modules/subnet"
  cidrs = "${var.private_cidrs}"
  availability_zones = "${var.availability_zones}"
  enviroment = "${var.enviroment}"
}

module "public_subnet" {
  source = "modules/subnet"
  cidrs = "${var.public_cidrs}"
  availability_zones = "${var.availability_zones}"
  enviroment = "${var.enviroment}"
}
