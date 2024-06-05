output "ci_role_arn" {
  description = "Role that we will use for GitLab CI Variables"
  value       = aws_iam_role.gitlab_ci.arn
}