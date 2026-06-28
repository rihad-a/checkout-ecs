# Creating an RDS instance

resource "aws_db_instance" "checkout_db" {
  identifier           = var.db_identifier
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = random_password.db_password.result
  parameter_group_name = var.db_parameter_group_name
  db_subnet_group_name = aws_db_subnet_group.checkout_db_subnet_group.name
  skip_final_snapshot  = true
  publicly_accessible  = false
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
}

# Creating an RDS subnet group

resource "aws_db_subnet_group" "checkout_db_subnet_group" {
  name       = "checkout_db_subnet_group"
  subnet_ids = var.private_subnets
}


