module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "customer_auth"
  description   = "Função responsável por realizar a autenticação com a base de dados"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  publish       = true

  source_path = "./resources/lambda"

  store_on_s3 = true 
  s3_bucket   = var.s3_bucket
  vpc_subnet_ids = var.vpc_subnet_ids

  environment_variables = var.environment_variables
}