terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks_cluster_vpc"
  cidr = "10.0.0.0/16"

  azs                           = ["us-west-2a", "us-west-2b"]
  public_subnets                = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets               = ["10.0.3.0/24", "10.0.4.0/24"]
  enable_nat_gateway            = true
  single_nat_gateway            = true
  enable_dns_hostnames          = true
  manage_default_security_group = true
  default_security_group_name   = "vpc-serverless-security-group"

  public_subnet_tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/elb"               = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
  }

  tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name                         = "tech_challenge_cluster"
  cluster_version                      = "1.28"
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["177.33.157.153/32"]

  subnet_ids = flatten([module.vpc.public_subnets, module.vpc.private_subnets])
  vpc_id     = module.vpc.vpc_id

  cluster_addons = {
    kube-proxy = {}
    vpc-cni    = {}
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
      subnets = flatten([module.vpc.private_subnets])
    }
  }
}
