# terraform-huaweicloud-dew

Magicorn made Terraform Module for Huawei Cloud Provider
--
```
module "dew" {
  source      = "magicorntech/dew/huaweicloud"
  version     = "0.0.1"
  tenant      = var.tenant
  name        = var.name
  environment = var.environment

  ##### KMS Configuration #####
  # Enabled Services
  ecs_encryption = true # Encrypts EVS Volumes & Enables ECS Key Pair Creation
  rds_encryption = false # Encrypts RDS Instances
  cce_encryption = false # Encrypts CCE Volumes

  # Generic Key Configuration
  key_usage        = "ENCRYPT_DECRYPT"
  key_algorithm    = "AES_256"
  is_enabled       = true
  rotation_enabled = true
  pending_days     = 7

  # EC2 Key Pair Configuration
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP4pI3O3wgYOS82gztfjcQ3ZdNCuDyFP70iCQnI8tYAp"
}

```