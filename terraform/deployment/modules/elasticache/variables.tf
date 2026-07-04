# Elasticache Variables 

variable "redis_replication_group_id" {
  type        = string
  description = "Id for the Redis replication group"
}

variable "redis_description" {
  type        = string
  description = "Description of the Redis cache purpose"
}

variable "redis_engine_version" {
  type        = string
  description = "The engine version for the Elasticache"
}

variable "redis_node_type" {
  type        = string
  description = "EC2 instance type for Redis nodes"
}

variable "redis_num_cache_clusters" {
  type        = number
  description = "Number of cache nodes (1 primary + 1 replica)"
}

variable "redis_parameter_group_name" {
  type        = string
  description = "Redis parameter group name"
}

variable "redis_automatic_failover_enabled" {
  type        = bool
  description = "Enable automatic failover for high availability"

}

variable "redis_multi_az_enabled" {
  type        = bool
  description = "Enable Multi-AZ replication for Redis"

}
