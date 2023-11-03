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

output "database_subnet_group_name" {
  description = "Nome do grupo da subnet"
  value = module.vpc.database_subnet_group_name 
}
output "default_security_group_id" {
  description = "ID do security group padrão criado"
  value = module.vpc.default_security_group_id
}