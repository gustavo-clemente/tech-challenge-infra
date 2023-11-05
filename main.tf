terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


module "vpc" {
  source = "./modules/vpc"
  create_database_internet_gateway_route = true
  create_database_subnet_route_table =  true
}

module "eks" {
  source = "./modules/eks"

  subnet_ids = flatten([module.vpc.public_subnet, module.vpc.private_subnets])
  control_plane_subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  fargate_subnet_ids = module.vpc.private_subnets
}


module "kms" {
  source = "./modules/kms"
}

module "aurora" {
  source = "./modules/aurora"
  vpc_id = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  source_security_group_id = module.eks.cluster_primary_security_group_id
}

module "ebs" {
  source = "./modules/ebs"

  mount_targets = {
    "us-west-2a" = {
      subnet_id = module.vpc.private_subnets[0]
    }

    "us-west-2b" = {
      subnet_id = module.vpc.private_subnets[1]
    }
  }

  security_group_vpc_id = module.vpc.vpc_id
  security_group_rules = {
     vpc = {
      description = "NFS ingress from VPC private subnets"
      cidr_blocks = module.vpc.private_subnets_cidr_blocks
    }
  }
}