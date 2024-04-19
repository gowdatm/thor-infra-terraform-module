terraform {
  source = "terraform-aws-lambda"
}
 
inputs = {
  function_name = "my-lambda-existing-package-local"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  create_package      = false
  s3_existing_package = {
    bucket = "aws_s3_bucket.builds.id"
    key    = "aws_s3_object.my_function.id"
  }
}