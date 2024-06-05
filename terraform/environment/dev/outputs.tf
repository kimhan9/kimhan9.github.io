output "CI_ROLE_ARN" {
  description = "Role that we will use for GitLab CI Variables"
  value       = module.oidc.ci_role_arn
}

output "lb_address" {
  value = module.ecs.lb_address
}

output "ecr_repo_url" {
  value = module.ecr.ecr_repo_url
}