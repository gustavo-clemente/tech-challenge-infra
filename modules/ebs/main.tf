module "efs" {
  source = "terraform-aws-modules/efs/aws"

  name             = var.nome_do_efs
  creation_token   = var.creation_token
  encrypted        = var.encrypted
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  mount_targets    = var.mount_targets
  security_group_vpc_id = var.security_group_vpc_id
  security_group_rules = var.security_group_rules
}