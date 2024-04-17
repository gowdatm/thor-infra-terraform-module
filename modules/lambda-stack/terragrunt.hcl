terraform {
  source = "./terraform-aws-lambda"
  // Add any necessary version constraints or other Terraform settings here
}

inputs = {
  function_name     = "my-lambda-function"
  description       = "My Lambda Function"
  role              = "arn:aws:iam::123456789012:role/lambda-role"
  handler           = "index.handler"
  runtime           = "nodejs14.x"
  timeout           = 60
  memory_size       = 512
  publish           = true
  vpc_subnet_ids    = ["subnet-12345678"]
  vpc_security_group_ids = ["sg-12345678"]
  
  // Add any additional inputs here as needed
}
