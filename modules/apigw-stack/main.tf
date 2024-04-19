module "api_gateway" {
  source = "./terraform-aws-apigateway-v2"
 
  name          = "my-api-gateway"
  description   = "HTTP API Gateway with Cognito auth and VPC links"
  protocol_type = "HTTP"
 
  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }
 
  create_api_domain_name = false
 
  integrations = {
    "ANY /" = {
      lambda_arn             = "arn:aws:lambda:eu-west-1:123456789012:function:my-lambda-function"
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }
 
    # Add more integrations as needed
 
    "GET /authenticated-route" = {
      integration_type    = "HTTP_PROXY"
      integration_uri     = "some-url"
      authorizer_key      = "cognito"
    }
 
    "GET /vpc-routed-route" = {
      connection_type     = "VPC_LINK"
      vpc_link            = "my-vpc"
      integration_uri     = "arn:aws:elasticloadbalancing:eu-west-1:123456789012:listener/app/my-alb/1234567890abcdef/9876543210abcdef"
      integration_type    = "HTTP_PROXY"
      integration_method  = "ANY"
    }
  }
 
  authorizers = {
    "cognito" = {
      authorizer_type    = "JWT"
      identity_sources   = ["$request.header.Authorization"]
      name               = "cognito-auth"
      audience           = ["your-cognito-audience"]
      issuer             = "https://your-cognito-domain.com/"
    }
  }
 
  vpc_links = {
    my-vpc = {
      name               = "example"
      security_group_ids = ["sg-1234567890abcdef"]
      subnet_ids         = ["subnet-12345678", "subnet-87654321"]
    }
  }
 
  tags = {
    Name = "private-api"
  }
}