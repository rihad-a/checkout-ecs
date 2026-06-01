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