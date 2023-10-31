module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = var.aurora_db_name
  engine         = var.aurora_db_engine
  engine_version = var.aurora_db_engine_version
  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10
  master_username = var.master_username
  skip_final_snapshot = true
}