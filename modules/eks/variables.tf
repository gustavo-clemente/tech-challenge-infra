variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "tech_challenge_cluster"
}

variable "cluster_version" {
  description = "Versão do cluster EKS"
  type        = string
  default     = "1.28"
}

variable "cluster_endpoint_public_access" {
  description = "Acesso público ao endpoint do cluster EKS"
  type        = bool
  default     = true
}