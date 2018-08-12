resource "aws_ecr_repository" "repository" {
  name = "${var.api-server}"
}

resource "aws_ecr_repository" "repository1" {
  name = "${var.earnings-scheduler}"
}