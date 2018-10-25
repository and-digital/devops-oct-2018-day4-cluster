output "ecs-load-balancer" {
  value = "${aws_alb.ecs-load-balancer}}"
}

output "ecs-target-group" {
  value = "${aws_alb_target_group.ecs-target-group}"
}

output "alb-listener" {
  value = "${aws_alb_listener.alb-listener}"
}