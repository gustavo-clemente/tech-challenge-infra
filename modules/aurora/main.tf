module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = var.aurora_db_name
  database_name = var.aurora_db_name
  engine         = var.aurora_db_engine
  engine_version = var.aurora_db_engine_version
  engine_mode       = var.aurora_db_engine_mode
  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10
  master_username = var.master_username
  
  skip_final_snapshot = true
  serverlessv2_scaling_configuration = {
    min_capacity = var.serverless_min_capacity
    max_capacity = var.serverless_max_capacity
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