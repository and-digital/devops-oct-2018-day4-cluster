
module "network" {
  source = "../network"
  enviroment = "${var.enviroment}"
  cidr = "${var.cidr}"
  private_cidrs = "${var.private_cidrs}"
  public_cidrs = "${var.public_cidrs}"
  availability_zones = "${var.availability_zones}"
}


module "ecs_instances" {
  source = "../ecs_instances"
  enviroment = "${var.enviroment}"
  instance_group = "${}"
  aws_aim = "${}"
  private_subnet_ids = "${}"
  instance_type = "${}"
  min_size = "${var.min_size}"
  max_size = "${var.max_size}"
  desired_capacity = "${var.desired_capacity}"
}

resource "aws_ecs_cluster" "cluster" {
  name = "${var.enviroment}"
}
