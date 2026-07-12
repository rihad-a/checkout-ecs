module "vpc" {
    source = "./modules/vpc"

    public_subnets = var.public_subnets
    private_subnets = var.private_subnets

}

module "alb" {
    source = "./modules/alb"

    cidr_block = var.cidr_block
    port_http = var.port_http
    port_https = var.port_https

    # Use these outputs
    public_subnets = module.vpc.public_subnets
    vpc_id = module.vpc.vpc_id
    certificate_arn = module.route53.certificate_arn
}

module "route53" {
    source = "./modules/route53"

    domain_name = var.domain_name

    # Use these outputs
    alb_dns = module.alb.alb_dns
    alb_zoneid = module.alb.alb_zoneid
}

module "rds" {
    source = "./modules/rds"

    db_identifier = var.db_identifier
    db_allocated_storage = var.db_allocated_storage
    db_storage_type = var.db_storage_type
    db_engine = var.db_engine
    db_engine_version = var.db_engine_version
    db_instance_class = var.db_instance_class
    db_name = var.db_name
    db_username = var.db_username
    db_parameter_group_name = var.db_parameter_group_name

    # Use these outputs
    private_subnets = module.vpc.private_subnets
}

module "elasticache" {
    source = "./modules/elasticache"

    redis_replication_group_id = var.redis_replication_group_id
    redis_description = var.redis_description
    redis_engine_version = var.redis_engine_version
    redis_node_type = var.redis_node_type
    redis_num_cache_clusters = var.redis_num_cache_clusters
    redis_parameter_group_name = var.redis_parameter_group_name
    redis_automatic_failover_enabled = var.redis_automatic_failover_enabled
    redis_multi_az_enabled = var.redis_multi_az_enabled

    # Use these outputs
    private_subnets = module.vpc.private_subnets
}

module "sqs" {
    source = "./modules/sqs"

    sqs_queue_name = var.sqs_queue_name
    sqs_delay_seconds = var.sqs_delay_seconds
    sqs_max_message_size = var.sqs_max_message_size
    sqs_message_retention_seconds = var.sqs_message_retention_seconds
    sqs_receive_wait_time_seconds = var.sqs_receive_wait_time_seconds
    sqs_visibility_timeout_seconds = var.sqs_visibility_timeout_seconds
    sqs_fifo_queue = var.sqs_fifo_queue
    sqs_content_based_deduplication = var.sqs_content_based_deduplication
    sqs_max_receive_count = var.sqs_max_receive_count
    sqs_dead_letter_queue_name = var.sqs_dead_letter_queue_name
    sqs_dead_letter_message_retention_seconds = var.sqs_dead_letter_message_retention_seconds
}