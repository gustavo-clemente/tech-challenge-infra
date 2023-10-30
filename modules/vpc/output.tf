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