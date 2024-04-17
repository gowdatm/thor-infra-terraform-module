module "my_lambda_function" {
  source = "./terraform-aws-lambda"  # Update this source to point to your Lambda module

  function_name     = var.function_name
  description       = var.description
  lambda_role       = var.lambda_role
  handler           = var.handler
  runtime           = var.runtime
  timeout           = var.timeout
  memory_size       = var.memory_size
  publish           = var.publish
  vpc_subnet_ids    = var.vpc_subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = merge(var.tags, {
    Terraform   = "true"
    Environment = "dev"
  })
}
