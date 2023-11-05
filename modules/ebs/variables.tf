variable "nome_do_efs" {
  description = "Nome do sistema de arquivos EFS"
  default     = "eks_ebs"
}

variable "creation_token" {
  description = "Token de criação do sistema de arquivos EFS"
  default     = "eks"
}

variable "encrypted" {
  description = "Indica se o sistema de arquivos EFS é criptografado"
  default     = true
}

variable "performance_mode" {
  description = "Modo de desempenho do sistema de arquivos EFS"
  default     = "generalPurpose"
}

variable "throughput_mode" {
  description = "Modo de throughput do sistema de arquivos EFS"
  default     = "elastic"
}

variable "mount_targets" {
  description = "Configuração dos pontos de montagem do sistema de arquivos EFS"
  default     = {}
}

variable "security_group_vpc_id" {
  description = "ID do grupo de segurança da VPC para o sistema de arquivos EFS"
  default     = ""
}