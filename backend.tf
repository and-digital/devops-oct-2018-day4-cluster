terraform {
  backend "s3" {
    bucket = "day4-ex1-ecs-cluster"
    key    = "path/to/my/key"
    region = "${var.region}"
  }
}
