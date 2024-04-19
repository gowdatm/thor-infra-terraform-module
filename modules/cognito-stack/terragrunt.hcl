
terraform {
  source = "./terraform-aws-cognito-user-pool"
 
  user_pool_name = "my_pool"
  tags = {
    Owner       = "infra"
    Environment = "production"
    Terraform   = true
  }
}



// terraform {
//   source = "./terraform-aws-cognito-user-pool"
// }
 
// inputs = {
//   enabled                             = true
//   user_pool_name                      = "example-user-pool"
//   alias_attributes                    = ["email"]
//   auto_verified_attributes            = ["email"]
//   email_verification_subject          = "Your temporary password"
//   email_verification_message          = "Your username is {username} and temporary password is {####}."
//   admin_create_user_config_email_subject = "Your temporary password"
//   admin_create_user_config_email_message = "Your username is {username} and temporary password is {####}."
//   # Add other necessary inputs for Cognito User Pool module here
// }

