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