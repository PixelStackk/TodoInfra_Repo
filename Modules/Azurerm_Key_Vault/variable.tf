variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    sku_name                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    key_permissions             = list(string)
    secret_permissions          = list(string)
    storage_permissions         = list(string)
  }))
}
