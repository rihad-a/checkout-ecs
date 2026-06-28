# General Variables 

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

# Module Variables

variable "private_subnets" {
  type = list(string)
  description = "The private subnet ids from the vpc module"
}

