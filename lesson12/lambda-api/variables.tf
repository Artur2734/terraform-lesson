variable "function_name" {
  description = "Name of the Lambda function"
}

variable "handler" {
  description = "Handler function for the Lambda function"
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  default     = "python3.8"
}

variable "api_name" {
  description = "Name of the API Gateway"
}

variable "api_path" {
  description = "Path for the API Gateway"
}

variable "http_method" {
  description = "HTTP method for the API Gateway"
  default     = "POST"
}
