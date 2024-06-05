variable "aws_region" {
  type = string
}

#------oidc--------#
variable "gitlab_tls_url" {
  type = string
  # Avoid using https scheme because the Hashicorp TLS provider has started following redirects starting v4.
  # See https://github.com/hashicorp/terraform-provider-tls/issues/249
  default = "tls://gitlab.com:443"
}

variable "gitlab_url" {
  type    = string
  default = "https://gitlab.com"
}

variable "aud_value" {
  type = string
}
variable "match_field" {
  type    = string
  default = "aud"
}

variable "match_value" {
  type = list(any)
}

#------------------#

#------ecr---------#
variable "ecr_repo_name" {
}

variable "ecr_app_tag" {
  type    = string
  default = "latest"
}
#------------------#

#------ecs---------#
variable "tag_resource" {
}

variable "prefix" {
}

variable "ecs_task_definition_file_location" {
}

variable "ecs_container_name" {
}

variable "asg_desired" {
}

variable "asg_max" {
}

variable "desired_tasks" {
}