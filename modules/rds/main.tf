data "aws_secretsmanager_secret" "example" {
  name = "rds_admin18-12"
  depends_on = [
    aws_secretsmanager_secret.demo_secret_manager
  ]
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.example.id
}

resource "aws_db_instance" "demo_rds_db" {
  identifier        = "my-demo-database"
  allocated_storage = var.allocated_storage
  storage_type      = "gp2"
  db_name           = "demo_db"
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  # manage_master_user_password = true
  username                = var.db_username
  password                = data.aws_secretsmanager_secret_version.secret.secret_string
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  publicly_accessible     = true
  multi_az                = false
  storage_encrypted       = true
  backup_retention_period = 7

  tags = {
    Name = "${var.project_name}-rds-db-${terraform.workspace}"
  }
}
