terraform {
  backend "s3" {
    bucket = "day4-ex1-ecs-cluster"
    key    = "ecs-cluster.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "day4-ex1-ecs-cluster"
    key    = "ecs-cluster.tfstate"
    region = "eu-west-1"
  }
}
