# Oficial eks module on terraform https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest/submodules/eks-managed-node-group
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.16"

  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  kms_key_administrators = ["arn:aws:iam::760886765969:user/gitlab","arn:aws:iam::760886765969:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO_AWSAdministratorAccess_b84705352cc2aa3b"]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  create_cluster_security_group = false
  create_node_security_group    = false

  eks_managed_node_groups = {
    default = {
      instance_types       = ["m5.large"]
      force_update_version = false

      min_size     = 1
      max_size     = 10
      desired_size = 3
      
      update_config = {
        max_unavailable_percentage = 50
      }

      labels = {
        workshop-default = "yes"
      }
    }
  }
  tags = merge(local.tags, {
    "karpenter.sh/discovery" = var.cluster_name
  })
}
