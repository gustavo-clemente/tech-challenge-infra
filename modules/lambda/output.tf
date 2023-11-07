output "lambda_function_arn" {
  description = "ARN da função lambda"
  value = module.lambda_function.lambda_function_arn
}

output "lambda_function_name" {
  description = "Nome gerado da função lambda"
  value = module.lambda_function.lambda_function_name
}