

module "cluster" {
  source = "modules/ecs"
  environment = "${var.environment}"
  cidr = "${var.cidr}"
  private_cidrs = "${var.private_cidrs}"
  public_cidrs = "${var.public_cidrs}"
  availability_zones = "${var.availability_zones}"
  key_name = "${aws_key_pair.key.key_name}"
}

resource "aws_key_pair" "key" {
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
