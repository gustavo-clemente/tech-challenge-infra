resource "aws_kms_key" "tech_challenge_helm_key" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  key_usage = var.key_usage
  multi_region = var.multi_region
}