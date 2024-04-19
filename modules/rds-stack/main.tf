module "aurora" {
  source = "./terraform-aws-rds-aurora"
 
  name            = var.name
  engine          = var.engine
  engine_version  = var.engine_version
  master_username = var.master_username
  master_password = var.master_password
  storage_type    = var.storage_type
  instance_class = var.instance_class
  instances = var.instances
 
  endpoints = var.endpoints
 
  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  security_group_rules = var.security_group_rules
 
  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot
 
  create_db_cluster_parameter_group      = var.create_db_cluster_parameter_group
  db_cluster_parameter_group_name        = var.db_cluster_parameter_group_name
  db_cluster_parameter_group_family      = var.db_cluster_parameter_group_family
  db_cluster_parameter_group_description = var.db_cluster_parameter_group_description
  db_cluster_parameter_group_parameters = var.db_cluster_parameter_group_parameters
 
  create_db_parameter_group      = var.create_db_parameter_group
  db_parameter_group_name        = var.db_parameter_group_name
  db_parameter_group_family      = var.db_parameter_group_family
  db_parameter_group_description = var.db_parameter_group_description
  db_parameter_group_parameters = var.db_parameter_group_parameters
 
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  create_cloudwatch_log_group     = var.create_cloudwatch_log_group
 
  create_db_cluster_activity_stream     = var.create_db_cluster_activity_stream
  db_cluster_activity_stream_kms_key_id = var.db_cluster_activity_stream_kms_key_id
  db_cluster_activity_stream_mode       = var.db_cluster_activity_stream_mode
 
  tags = var.tags
}