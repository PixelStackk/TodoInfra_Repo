resource "azurerm_storage_account" "stg" {
  for_each                      = var.storage_accounts
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  account_replication_type      = each.value.account_replication_type
  account_tier                  = each.value.account_tier
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags
}
