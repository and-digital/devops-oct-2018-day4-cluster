

module "ecs" {
  source = "modules/ecs"
  environment = "${var.environment}"
  cidr = "${var.cidr}"
  private_cidrs = "${var.private_cidrs}"
  public_cidrs = "${var.public_cidrs}"
  availability_zones = "${var.availability_zones}"
  key_name = "${aws_key_pair.key.key_name}"
  aws_aim = "${var.aws_aim}"
}

resource "aws_key_pair" "key" {
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}


output "vpc_ip" {
  value = "${module.ecs.vpc_id}"
}
