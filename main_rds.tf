resource "huaweicloud_kms_key" "rds" {
  count            = (var.rds_encryption == true) ? 1 : 0
  key_alias        = "alias/${var.tenant}/${var.name}/rds/${var.environment}"
  key_description  = "${var.tenant}-${var.name}-rds-dew-${var.environment}"
  origin           = "kms"
  key_usage        = var.key_usage
  key_algorithm    = var.key_algorithm
  is_enabled       = var.is_enabled
  rotation_enabled = var.rotation_enabled
  pending_days     = var.pending_days

  tags = {
    Name        = "${var.tenant}-${var.name}-rds-dew-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}