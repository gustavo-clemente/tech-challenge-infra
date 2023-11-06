variable "auth_lambda_arn" {
  description = "ARN da lambda que será utilizada para autenticação"
  type = string
}
variable "auth_lambda_name" {
    description = "Nome da função lambda de autenticação"
    type = string
}