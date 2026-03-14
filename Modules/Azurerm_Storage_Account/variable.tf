variable "storage_accounts" {
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    account_replication_type      = string
    account_tier                  = string
    public_network_access_enabled = bool
    tags                          = map(string)
  }))
}
