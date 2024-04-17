# Configure Terragrunt to use the AWS provider
terraform {
  source = "./terraform-aws-rds-aurora-master"
}

# Define the input variables
inputs = {
  cluster_name                 = "my-cluster"
  engine                       = "aurora-postgresql"
  engine_version               = "11.13"
  instance_class               = "db.r5.large"
  vpc_id                       = "vpc-123456789"
  db_subnet_group_name         = "my-db-subnet-group"
  storage_encrypted            = true
  apply_immediately            = true
  monitoring_interval          = 60
  enabled_cloudwatch_logs_exports = ["postgresql"]

  instances = {
    1 = {
      identifier             = "instance-1"
      instance_class         = "db.r5.large"
      publicly_accessible   = true
    }
    2 = {
      identifier             = "instance-2"
      instance_class         = "db.r5.large"
      publicly_accessible   = false
    }
  }

  security_group_rules = {
    ingress = [
      {
        description = "Allow PostgreSQL inbound traffic"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
