module "vpc" {
  source = "../vpc"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  depends_on = [module.vpc] 
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  subnet_ids = flatten([module.vpc.public_subnet, module.vpc.private_subnets])
  control_plane_subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  cluster_addons = {
    coredns = {
      configuration_values = jsonencode({
        computeType = "Fargate"
      })
    }
  }
  fargate_profiles = {
    tech_challenge = {
      name = "tech-challenge"
      selectors = [
        {
          namespace = "api-tech-challenge"
        },
        {
          namespace = "monitoring-tech-challenge"
        },
        {
          namespace = "database-tech-challenge"
        },
        {
          namespace = "kube-system"
        }
      ]

      subnet_ids = module.vpc.private_subnets
    }
  }
}