module "my_db_instance" {
  source = "./terraform-aws-rds-aurora"

  engine                   = var.engine
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  master_username          = var.master_username
  master_password          = var.master_password
  db_subnet_group_name     = var.db_subnet_group_name
  vpc_security_group_ids   = var.vpc_security_group_ids
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
