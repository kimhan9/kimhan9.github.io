resource "aws_ecr_repository" "ecr_app_repo" {
  name         = var.name
  force_delete = true
}
