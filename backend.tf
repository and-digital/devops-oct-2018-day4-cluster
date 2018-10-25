terraform {
  backend "s3" {
    bucket = "${var.aws_state_bucket}}"
    key    = "${var.aws_state_bucket_key}"
    region = "${var.region}"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "${var.aws_state_bucket}}"
    key    = "${var.aws_state_bucket_key}"
    region = "${var.region}"
  }
}
