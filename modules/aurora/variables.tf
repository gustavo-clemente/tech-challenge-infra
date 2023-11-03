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
  default     = "15.4"
}

variable "aurora_db_engine_mode" {
  description = "Engine utilizada para o banco de dados"
  type = string
  default = "provisioned"
}

variable "serverless_min_capacity" {
  description = "Capacidade miníma de instâncias provisionadas"
  type = number
  default = 2
}

variable "serverless_max_capacity" {
  description = "Capacidade maxima de instâncias provisionadas"
  type = number
  default = 5
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