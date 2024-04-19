

module "aws_cognito_user_pool_simple" {
 
  source  = "./terraform-aws-cognito-user-pool"
 
  user_pool_name = var.user_pool_name
 
  tags = {
    Owner       = "infra"
    Environment = "production"
    Terraform   = true
  }
}

# module "cognito_user_pool" {
#   source = "./terraform-aws-cognito-user-pool"

#   enabled                             = var.enabled
#   user_pool_name                      = var.user_pool_name
#   alias_attributes                    = var.alias_attributes
#   auto_verified_attributes            = var.auto_verified_attributes
#   email_verification_subject          = var.email_verification_subject
#   email_verification_message          = var.email_verification_message
#   admin_create_user_config_email_subject = var.admin_create_user_config_email_subject
#   admin_create_user_config_email_message = var.admin_create_user_config_email_message
#   # Add other variables here
# }