module "vpc" {
  source = "../vpc"
}

module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = var.aurora_db_name
  engine         = var.aurora_db_engine
  engine_version = var.aurora_db_engine_version
  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10
}