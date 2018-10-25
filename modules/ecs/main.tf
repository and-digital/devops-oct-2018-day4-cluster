
module "network" {
  source = "../network"
  environment = "${var.environment}"
  cidr = "${var.cidr}"
  private_cidrs = "${var.private_cidrs}"
  public_cidrs = "${var.public_cidrs}"
  availability_zones = "${var.availability_zones}"
}

module "ecs_instances" {
  source = "../ecs_instances"
  environment = "${var.environment}"
  instance_group = "${var.instance_group}"
  aws_ami = "${var.aws_aim}"
  private_cidrs = "${module.network.private_subnet_ids}"
  instance_type = "${var.instance_type}"
  min_size = "${var.min_size}"
  max_size = "${var.max_size}"
  desired_capacity = "${var.desired_capacity}"
  vpc_id = "${module.network.vpc_id}"
  key_name = "${var.key_name}"
  load_balancers = "${var.load_balancers}"
  availability_zones = "${var.availability_zones}"
  cidr = "${var.cidr}"
}

resource "aws_ecs_cluster" "cluster" {
  name = "${var.environment}"
}

