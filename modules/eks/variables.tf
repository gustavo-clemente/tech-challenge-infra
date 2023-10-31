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

variable "lb_role_name" {
  description = "O nome desejado para a função IAM que será criada para o Load Balancer do Amazon EKS."
  type = string
  default = "role_eks_lb"
}

variable "service_account_name"{
  description = "Nome desejado para o service account responsável por instalar o load balancer controller"
  type = string
  default = "aws-load-balancer-controller"
}

variable "subnet_ids" {
  description = "Lista com o ID das subnets associadas"
  type = list
  default = []
}

variable "control_plane_subnet_ids" {
  description = "Lista com o ID das subnets associadas ao control plane do cluster"
  type = list
  default = []
}

variable "vpc_id" {
  description = "ID da vpc associada"
  type = string
  default = ""
}

variable "fargate_subnet_ids" {
  description = "ID's das subentes associadas ao fargate"
  type = list
  default = []
}