variable "public_subnets" {
  type = list(string)
  description = "The public subnet ids from the vpc module"
}

variable "vpc_id" {
  type = string
  description = "The VPC id from the vpc module"
}

variable "cidr_block" {
  type = string
  description = "The CIDR block for the alb security group rules"
}

variable "certificate_arn" {
  type = string
  description = "The certificate arn from the route53 module"
}

variable "port_http" {
  type = number
  description = "The port for the alb HTTP listener"
}

variable "port_https" {
  type = number
  description = "The port for the alb HTTPS listener"
}