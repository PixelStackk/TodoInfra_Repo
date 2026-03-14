resource "azurerm_storage_container" "container" {
    for_each = var.storage_containers
    name = each.value.name
    storage_account_id = data.azurerm_storage_account.stg[each.key].id
    container_access_type = each.value.container_access_type

}