output "cluster_master_username" {
  description = "Nome do usuário mestre gerado pelo RDS"
  value = module.aurora.cluster_master_username
}

output "cluster_master_user_secret" {
  description = "Senha mestre gerada pelo RDS"
  value = module.aurora.cluster_master_user_secret
}

output "cluster_database_name" {
  description = "Nome do banco de dados gerado automáticamente"
  value = module.aurora.cluster_database_name
}

output "cluster_reader_endpoint" {
  description = "Endpoint somente de leitura da instância do banco"
  value = module.aurora.cluster_reader_endpoint
}

output "cluster_port" {
  description = "Porta do cluster do database"
  value = module.aurora.cluster_port
}