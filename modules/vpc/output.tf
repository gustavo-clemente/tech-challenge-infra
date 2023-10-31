output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "public_subnet" {
  description = "IDs das subnets públicas criadas"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "IDs das subnets privadas criadas"
  value       = module.vpc.private_subnets
}

output "db_subnet_group_name" {
  description = "Nome do grupo da subnet"
  value = module.vpc.db_subnet_group_name 
}