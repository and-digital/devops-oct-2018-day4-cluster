
module "vpc" {
  source = "../vpc"
  cidr = "${var.cidr}"
  enviroment = "${var.enviroment}"
}

module "private_subnet" {
  source = "../subnet"
  cidrs = "${var.private_cidrs}"
  availability_zones = "${var.availability_zones}"
  enviroment = "${var.enviroment}"
  vpc_id = "${module.vpc.id}"
}

module "public_subnet" {
  source = "../subnet"
  cidrs = "${var.public_cidrs}"
  availability_zones = "${var.availability_zones}"
  enviroment = "${var.enviroment}"
  vpc_id = "${module.vpc.id}"
}


resource "aws_route" "public_igw_route" {
  route_table_id = "${element(module.public_subnet.route_table_ids, count.index)}"
  count = "${count(var.public_cidrs)}"
  gateway_id = "${module.vpc.igw}"
  destination_cidr_block = "${var.destination_cidr_block}"
}
