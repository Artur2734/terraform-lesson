provider "aws" {
  region = "us-east-1" 
}
module "lambda" {
  source             = "./lambda"
  function_name      = var.function_name
  handler            = var.handler
  runtime            = var.runtime
}

module "api_gateway" {
  source      = "./api_gateway"
  api_name    = var.api_name
  api_path    = var.api_path
  http_method = var.http_method
  lambda_arn  = module.lambda.lambda_arn
}
