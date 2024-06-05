output "ecr_repo_url" {
  description = "ECR Repo URL for App Deployment"
  value       = aws_ecr_repository.ecr_app_repo.repository_url
}