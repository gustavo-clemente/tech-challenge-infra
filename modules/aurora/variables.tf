variable "aurora_db_name" {
  description = "Nome do cluster Aurora"
  type        = string
  default     = "tech-challenge"
}

variable "aurora_db_engine" {
  description = "Tipo de mecanismo do cluster Aurora"
  type        = string
  default     = "aurora-postgresql"
}

variable "aurora_db_engine_version" {
  description = "Versão do mecanismo do cluster Aurora"
  type        = string
  default     = "14.5"
}

variable "vpc_id" {
  description = "ID da vpc associada"
  type = string
}

variable "db_subnet_group_name" {
  description = "Nome do grupo das subnets"
  type = string
}

variable "master_username" {
  description = "Username do usuário master"
  type = string
  default = "root"
}