variable "s3_bucket" {
  description = "Nome do bucket S3 para armazenar o código-fonte"
}

variable "vpc_subnet_ids" {
  description = "IDs das sub-redes da VPC onde a função Lambda será executada"
  type        = list(string)
}

variable "environment_variables" {
  description = "Variáveis de ambiente para a função Lambda"
  type        = map(string)

}