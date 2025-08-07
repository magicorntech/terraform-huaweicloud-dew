resource "huaweicloud_kms_key" "ecs" {
  count            = (var.ecs_encryption == true) ? 1 : 0
  key_alias        = "alias/${var.tenant}/${var.name}/ecs/${var.environment}"
  key_description  = "${var.tenant}-${var.name}-ecs-dew-${var.environment}"
  origin           = "kms"
  key_usage        = var.key_usage
  key_algorithm    = var.key_algorithm
  is_enabled       = var.is_enabled
  rotation_enabled = var.rotation_enabled
  pending_days     = var.pending_days

  tags = {
    Name        = "${var.tenant}-${var.name}-ecs-dew-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "huaweicloud_kps_keypair" "ecs" {
  count       = var.public_key != null ? 1 : 0
  name        = "${var.tenant}-${var.name}-ecs-keypair-${var.environment}"
  scope       = "account"
  description = "Managed by Magicorn"
  public_key  = var.public_key
}
