# Creating a Redis Elasticache replication group

resource "aws_elasticache_replication_group" "redis" {
  automatic_failover_enabled  = var.redis_automatic_failover_enabled
  multi_az_enabled            = var.redis_multi_az_enabled
  replication_group_id        = var.redis_replication_group_id
  description                 = var.redis_description
  engine                      = "redis"
  engine_version              = var.redis_engine_version
  node_type                   = var.redis_node_type
  num_cache_clusters          = var.redis_num_cache_clusters
  parameter_group_name        = var.redis_parameter_group_name
  port                        = 6379
}

# Creating the subnet group for the Redis Elasticache replication group

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.redis_replication_group_id}-subnet-group"
  subnet_ids = var.private_subnets
}