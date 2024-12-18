
/*resource "random_password" "demo_password" {
  length           = 16
  special          = true
  override_special = "_!%^"
}*/

resource "aws_secretsmanager_secret" "demo_secret_manager" {
  kms_key_id              = aws_kms_key.demo_kms_key.key_id
  name                    = "rds_admin18"
  description             = "RDS Admin password"
  recovery_window_in_days = 14
  tags = {
    Name = "${var.project_name}-secret-mgr-${terraform.workspace}"
  }
}

resource "aws_secretsmanager_secret_version" "demo_secret_version" {
  secret_id     = aws_secretsmanager_secret.demo_secret_manager.id
  secret_string = var.db_password
}
