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