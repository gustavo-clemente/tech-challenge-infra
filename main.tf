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
  create_database_subnet_route_table =  false
}

module "eks" {
  source = "./modules/eks"

  subnet_ids = module.vpc.private_subnets
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

module "efs" {
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

module "s3" {
  source = "./modules/s3"
}

module "lambda" {
  source = "./modules/lambda"

  vpc_subnet_ids = module.vpc.private_subnets
  s3_bucket = module.s3.s3_bucket_id

  environment_variables = {
    DB_USER     = tostring(module.aurora.cluster_master_username),
    DB_HOST     = tostring(module.aurora.cluster_reader_endpoint),
    DB_DATABASE = tostring(module.aurora.cluster_database_name),
    DB_PASSWORD = tostring(""),
    DB_PORT = tostring(module.aurora.cluster_port)
  }
}

module "api-gateway" {
  source = "./modules/api-gateway"

  auth_lambda_arn = module.lambda.lambda_function_arn
  auth_lambda_name = module.lambda.lambda_function_name
}