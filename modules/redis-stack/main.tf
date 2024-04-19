module "redis" {
  source = "./terraform-aws-elasticache-redis"

  availability_zones         = var.availability_zones
  zone_id                    = var.zone_id
  vpc_id                     = var.vpc_id
  allowed_security_group_ids = var.allowed_security_group_id
  subnets                    = var.
  cluster_size               = var.cluster_size
  instance_type              = var.instance_type
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = var.engine_version
  family                     = var.family
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled

  parameter = [
    {
      name  = "notify-keyspace-events"
      value = "lK"
    }
  ]

  context = module.this.context
}
