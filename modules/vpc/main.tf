module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr

  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = var.enable_nat_gateway

  public_subnet_tags = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags

  create_database_subnet_group = true
  database_subnets = var.database_subnets
}