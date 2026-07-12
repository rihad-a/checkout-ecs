# General Variables 

variable "domain_name" {
  type        = string
  description = "The domain name for the infrastructure"
}

# VPC Variables

variable "public_subnets" {
    type = list(object({
        cidr_block = string
        availability_zone = string
        map_public_ip_on_launch_public = bool
    }))
    description = "Two public subnets"
}

variable "private_subnets" {
    type = list(object({
        cidr_block = string
        availability_zone = string
        map_public_ip_on_launch_private = bool
    }))
    description = "Two private subnets"
}

# ALB Variables

variable "cidr_block" {
  type = string
  description = "The CIDR block for the alb security group rules"
}

variable "port_http" {
  type = number
  description = "The port for the alb HTTP listener"
}

variable "port_https" {
  type = number
  description = "The port for the alb HTTPS listener"
}

# RDS Variables

variable "db_identifier" {
  type        = string
  description = "Identifier for the RDS instance"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage size for the RDS instance"
}

variable "db_storage_type" {
  type        = string
  description = "Storage type for the RDS instance"
}

variable "db_engine" {
  type        = string
  description = "Database engine for the RDS instance"
}

variable "db_engine_version" {
  type        = string
  description = "Engine version for the RDS instance"
}

variable "db_instance_class" {
  type        = string
  description = "Instance class for the RDS instance"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_username" {
  type        = string
  description = "Username for the database"
}

variable "db_parameter_group_name" {
  type        = string
  description = "Parameter group name for the RDS instance"
}

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

# SQS Variables


variable "sqs_queue_name" {
  type        = string
  description = "The name of the SQS queue used for event processing"
}

variable "sqs_delay_seconds" {
  type        = number
  description = "The amount of time a message is delayed before becoming processing"
}

variable "sqs_max_message_size" {
  type        = number
  description = "The maximum size in bytes allowed for messages"
}

variable "sqs_message_retention_seconds" {
  type        = number
  description = "The amount of time messages remain available in the queue"
}

variable "sqs_receive_wait_time_seconds" {
  type        = number
  description = "The amount of time SQS waits for messages during long polling requests"
}

variable "sqs_visibility_timeout_seconds" {
  type        = number
  description = "The amount of time a received message remains hidden whilst being processed"
}

variable "sqs_fifo_queue" {
  type        = bool
  description = "Determines whether the SQS queue uses FIFO method for message ordering and delivery"
}

variable "sqs_content_based_deduplication" {
  type        = bool
  description = "Determines whether SQS automatically prevents duplicate messages"
}

variable "sqs_max_receive_count" {
  type        = number
  description = "The number of failed message processing attempts before moving to the dead letter queue"
}


variable "sqs_dead_letter_queue_name" {
  type        = string
  description = "The name of the dead letter queue used to store failed SQS messages"
}

variable "sqs_dead_letter_message_retention_seconds" {
  type        = number
  description = "The amount of time failed messages are retained in the dead letter queue for investigation"
}