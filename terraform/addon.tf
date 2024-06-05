data "aws_ecrpublic_authorization_token" "token" {
}

module "eks_blueprints_addons" {
  source = "aws-ia/eks-blueprints-addons/aws"
  version = "1.12.0"

  enable_karpenter = true

  karpenter_enable_spot_termination          = true
  karpenter_enable_instance_profile_creation = true
  karpenter = {
    repository_username = data.aws_ecrpublic_authorization_token.token.user_name
    repository_password = data.aws_ecrpublic_authorization_token.token.password

    set = [{
      name  = "replicas"
      value = "1"
    }]
  }

  cluster_name      = var.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = var.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn
}

output "environment" {
  value = <<EOF
export KARP_ROLE="${module.eks_blueprints_addons.karpenter.node_iam_role_name}"
export KARP_ARN="${module.eks_blueprints_addons.karpenter.node_iam_role_arn}"
EOF
}
