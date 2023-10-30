variable "description" {
  description = "Descrição da chave"
  type = string
  default = "Chave KMS utilizada para encriptar os valores do chart Helm da aplicação"
}
variable "deletion_window_in_days" {
    description = "Tempo em dias no qual a chave deve ser excluida"
    type = number
    default = 30
}

variable "key_usage" {
  description = "Tipo de utilização da chave"
  type = string
  default = "ENCRYPT_DECRYPT"
}

variable "multi_region" {
  description = "Indica se a chave será multi região"
  type = bool
  default = true
}