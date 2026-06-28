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