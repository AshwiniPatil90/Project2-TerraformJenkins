# KMS key used by Secrets Manager for RDS
resource "aws_kms_key" "demo_kms_key" {
  description             = "KMS key for RDS"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = "${var.project_name}-rds-kms-${terraform.workspace}"
  }
}
