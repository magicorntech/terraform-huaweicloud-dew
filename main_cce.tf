resource "huaweicloud_kms_key" "cce" {
  count            = (var.cce_encryption == true) ? 1 : 0
  key_alias        = "alias/${var.tenant}/${var.name}/cce/${var.environment}"
  key_description  = "${var.tenant}-${var.name}-cce-dew-${var.environment}"
  origin           = "kms"
  key_usage        = var.key_usage
  key_algorithm    = var.key_algorithm
  is_enabled       = var.is_enabled
  rotation_enabled = var.rotation_enabled
  pending_days     = var.pending_days

  tags = {
    Name        = "${var.tenant}-${var.name}-cce-dew-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}