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

variable "aurora_db_instance_class" {
  description = "Classe de instância do cluster Aurora"
  type        = string
  default     = "db.r6g.large"

  # Adicione outras variáveis necessárias para o módulo Aurora
}