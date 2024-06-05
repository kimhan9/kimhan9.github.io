terraform {
  backend "s3" {
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.26"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0"
    }
  }
}

module "oidc" {
  source      = "../../modules/oidc"
  gitlab_url  = var.gitlab_url
  match_field = var.match_field
  match_value = var.match_value
  aud_value   = var.aud_value
}

module "ecr" {
  source = "../../modules/ecr"
  name   = var.ecr_repo_name
}

module "ecs" {
  source = "git::https://gitlab.com/jrandazzo/terraform-ecs-gitlab.git"

  ecs_task_definition_file_location = var.ecs_task_definition_file_location
  ecs_container_repository_image    = format("%s:%s", module.ecr.ecr_repo_url, var.ecr_app_tag)
  ecs_container_name                = var.ecs_container_name
  asg_desired                       = var.asg_desired
  asg_max                           = var.asg_max
  desired_tasks                     = var.desired_tasks
  tag_resource                      = var.tag_resource
  prefix                            = var.prefix
}
