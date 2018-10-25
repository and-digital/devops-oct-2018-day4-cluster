output "ecs-load-balancer" {
  value = "${aws_alb.ecs-load-balancer.id}"
}

output "ecs-target-group" {
  value = "${aws_alb_target_group.ecs-target-group.id}"
}

output "alb-listener" {
  value = "${aws_alb_listener.alb-listener.id}"
}

output "alb_security_group_id" {
  value = "${aws_security_group.alb_sg.id}"
}
