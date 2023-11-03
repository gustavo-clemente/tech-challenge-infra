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
  source_security_group_id = module.vpc.default_security_group_id
}