output "kms_key_id" {
  description = "ID da chave gerada"
  value = aws_kms_key.tech_challenge_helm_key.id
}