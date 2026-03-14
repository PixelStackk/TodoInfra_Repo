data "azurerm_storage_account" "stg" {
    for_each = var.storage_containers
    name = each.value.storage_account_name
    resource_group_name = each.value.resource_group_name

}