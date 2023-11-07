variable "vpc_id" {
  description = "ID da vpc associada"
  type = string
}

variable "db_subnet_group_name" {
  description = "Nome do grupo das subnets"
  type = string
}

variable "source_security_group_id" {
  description = "ID do security Group que poderá acessar o cluster do banco de dados"
  type = string
}

variable "rds_proxy_private_subnets_cidr_blocks" {
  description = "Sub nets privadas que serão associadas ao proxy do rds"
  type = list
}

variable "rds_proxy_database_subnets_cidr_blocks" {
  description = "Sub nets de Database que serão associadas ao proxy do rds"
  type = list
}

variable "rds_proxy_private_subnet_ids"{
  description = "ID's das sub nets privadas para utilização no proxy"
}