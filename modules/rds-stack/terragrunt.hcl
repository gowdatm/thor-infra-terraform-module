terraform {
  source = "./terraform-aws-rds-aurora"
}
 
inputs = {
  name                             = "your-cluster-name"
  engine                           = "aurora-postgresql"
  engine_version                   = "14.7"
  master_username                  = "admin"
  master_password                  = "your_master_password"
  storage_type                     = "aurora-iopt1"
  instance_class                   = "db.r5.large"
  instances                        = {
    one = {
      instance_class          = "db.r5.large"
      publicly_accessible     = true
      db_parameter_group_name = "default.aurora-postgresql14"
    }
  }
  endpoints                        = {
    static = {
      identifier       = "static-custom-endpt"
      type             = "ANY"
      static_members   = ["static-member-1"]
      tags             = { Endpoint = "static-members" }
    }
    excluded = {
      identifier       = "excluded-custom-endpt"
      type             = "READER"
      excluded_members = ["excluded-member-1"]
      tags             = { Endpoint = "excluded-members" }
    }
  }
  security_group_rules             = {
    vpc_ingress = {
      cidr_blocks = ["10.33.0.0/28"]
    }
    egress_example = {
      cidr_blocks = ["10.33.0.0/28"]
      description = "Egress to corporate printer closet"
    }
  }
  apply_immediately               = true
  skip_final_snapshot             = true
  create_db_cluster_parameter_group = true
  db_cluster_parameter_group_name   = "aurora-cluster-param-group"
  db_cluster_parameter_group_family = "aurora-postgresql14"
  db_cluster_parameter_group_description = "Aurora PostgreSQL example cluster parameter group"
  db_cluster_parameter_group_parameters = [
    {
      name         = "log_min_duration_statement"
      value        = 4000
      apply_method = "immediate"
    },
    {
      name         = "rds.force_ssl"
      value        = 1
      apply_method = "immediate"
    }
  ]
  create_db_parameter_group       = true
  db_parameter_group_name         = "aurora-db-param-group"
  db_parameter_group_family       = "aurora-postgresql14"
  db_parameter_group_description = "Aurora PostgreSQL example DB parameter group"
  db_parameter_group_parameters = [
    {
      name         = "log_min_duration_statement"
      value        = 4000
      apply_method = "immediate"
    }
  ]
  enabled_cloudwatch_logs_exports = ["postgresql"]
  create_cloudwatch_log_group     = true
  create_db_cluster_activity_stream     = true
  db_cluster_activity_stream_kms_key_id = "your-kms-key-id"
  db_cluster_activity_stream_mode       = "async"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}