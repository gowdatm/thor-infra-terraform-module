terraform {
  source = "./cognito_user_pool_module"
}

inputs = {
  user_pool_name           = "example-user-pool"
  minimum_password_length  = 12
  require_lowercase        = true
  require_numbers          = true
  require_symbols          = true
  require_uppercase        = true
  user_pool_client_name    = "example-client"
  generate_client_secret   = true
  allowed_oauth_flows      = ["code"]
  allowed_oauth_scopes     = ["openid"]
  callback_urls            = ["https://example.com/callback"]
  default_redirect_uri     = "https://example.com"
}
