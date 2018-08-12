resource "aws_ecr_repository" "repository" {
  name = "${var.ecr_repository}/${var.api-server}"
}

resource "aws_ecr_repository" "repository1" {
  name = "${var.ecr_repository}/${var.earnings-scheduler}"
}