resource "aws_security_group" "sg" {
  name = "vote_app_sg"
  description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"

  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port = "8080"
    to_port = "80   80"
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
    self = true
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
    self = true
  }

  tags {
    Name = "vote_app_sg"
  }
}

resource "aws_launch_configuration" "lg" {
  image_id = "ami-2d39803a",
  instance_type = "t2.micro",
  security_groups = [
    "${lc-sec-group-id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  launch_configuration = "${aws_launch_configuration.lg.id}"
  availability_zones = ["${var.availability_zones}"]

  load_balancers = ["${var.ecs-load-balancer}"]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key = "Name"
    value = "asg"
    propagate_at_launch = true
  }
}