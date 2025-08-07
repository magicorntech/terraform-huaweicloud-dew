output "ecs_keypair_name" {
  value = huaweicloud_kps_keypair.ecs[*].name
}

output "ecs_key_id" {
  value = huaweicloud_kms_key.ecs[*].key_id
}

output "rds_key_id" {
  value = huaweicloud_kms_key.rds[*].key_id
}

output "cce_key_id" {
  value = huaweicloud_kms_key.cce[*].key_id
}