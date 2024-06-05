data "tls_certificate" "gitlab" {
  url = var.gitlab_tls_url
}

resource "aws_iam_openid_connect_provider" "gitlab" {
  url             = var.gitlab_url
  client_id_list  = [var.aud_value]
  thumbprint_list = [data.tls_certificate.gitlab.certificates[0].sha1_fingerprint]
}

data "aws_iam_policy_document" "assume-role-policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.gitlab.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${aws_iam_openid_connect_provider.gitlab.url}:${var.match_field}"
      values   = var.match_value
    }
  }

}

# ECS IAM Policy
data "aws_iam_policy" "ecs_access" {
  arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

# ECR Access
# Private ECR: arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser
# Public ECR: arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicPowerUser 
data "aws_iam_policy" "ecr_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_role" "gitlab_ci" {
  name_prefix         = "GitLabCI"
  assume_role_policy  = data.aws_iam_policy_document.assume-role-policy.json
  managed_policy_arns = [data.aws_iam_policy.ecs_access.arn, data.aws_iam_policy.ecr_access.arn]
}


