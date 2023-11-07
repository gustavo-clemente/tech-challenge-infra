module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = "techchallenge-instance"
  database_name = "techchallenge"
  engine         = "aurora-postgresql"
  engine_version = "15.4"
  engine_mode       = "provisioned"
  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10
  master_username = "root"
  skip_final_snapshot = true
  serverlessv2_scaling_configuration = {
    min_capacity = 2
    max_capacity = 5
  }

  instance_class = "db.serverless"
  instances = {
    one = {
      publicly_accessible = true
    }
    two = {
      publicly_accessible = true
    }
  }

  security_group_rules = {
    ex1_ingress = {
      source_security_group_id = var.source_security_group_id
    }
  }
}


module "rds_proxy" {
  source = "terraform-aws-modules/rds-proxy/aws"

  name                   = "techchallenge-rds-proxy"
  iam_role_name          = "rds_proxy_role"
  vpc_subnet_ids         = var.rds_proxy_private_subnet_ids
  vpc_security_group_ids = [module.rds_proxy_sg.security_group_id]

  endpoints = {
    read_write = {
      name                   = "read-write-endpoint"
      vpc_subnet_ids         = var.rds_proxy_private_subnet_ids
      vpc_security_group_ids = [module.rds_proxy_sg.security_group_id]
    },
    read_only = {
      name                   = "read-only-endpoint"
      vpc_subnet_ids         = var.rds_proxy_private_subnet_ids
      vpc_security_group_ids = [module.rds_proxy_sg.security_group_id]
      target_role            = "READ_ONLY"
    }
  }

  auth = {
    "root" = {
      description = "Cluster generated master user password"
      secret_arn  = module.aurora.cluster_master_user_secret[0].secret_arn
    }
  }

  engine_family = "POSTGRESQL"
  debug_logging = true

  # Target Aurora cluster
  target_db_cluster     = true
  db_cluster_identifier = module.aurora.cluster_id
}

module "rds_proxy_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "techchallenge-rds-proxy-securitygroup"
  description = "Security Group do Proxy RDS"
  vpc_id      = var.vpc_id

  revoke_rules_on_delete = true

  ingress_with_cidr_blocks = [
    {
      description = "Private subnet PostgreSQL access"
      rule        = "postgresql-tcp"
      cidr_blocks = join(",", var.rds_proxy_private_subnets_cidr_blocks)
    }
  ]

  egress_with_cidr_blocks = [
    {
      description = "Database subnet PostgreSQL access"
      rule        = "postgresql-tcp"
      cidr_blocks = join(",", var.rds_proxy_database_subnets_cidr_blocks)
    },
  ]

}