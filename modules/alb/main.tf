resource "aws_alb" "ecs-load-balancer" {
  name = "ecs-load-balancer"
  security_groups = ["${aws_security_group.alb_sg.id}"]
  subnets = ["${var.public_subnet_ids}"]

  tags {
    Name = "ecs-load-balancer"
  }
}

resource "aws_alb_target_group" "ecs-target-group" {
  name = "ecs-target-group"
  port = "80"
  protocol = "HTTP"
  vpc_id = "${var.vpc_id}"

  health_check {
    healthy_threshold = "5"
    unhealthy_threshold = "2"
    interval = "30"
    matcher = "200"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = "5"
  }

  tags {
    Name = "ecs-target-group"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
    type = "forward"
  }
}

resource "aws_security_group" "alb_sg" {
  name = "awdawd"
  vpc_id = "${var.vpc_id}"


  tags {
    Name = "${var.environment}"
  }

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["${var.allow_cidr_block}"]
  }

  ingress {
    from_port = 443
    protocol = "TCP"
    to_port = 443
  }
}
