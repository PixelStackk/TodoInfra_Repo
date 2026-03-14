data "azurerm_network_interface" "nic" {
  for_each = var.virtual_machines
  name = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "kv" {
  for_each = var.virtual_machines
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "vm_username" {
  for_each     = var.virtual_machines
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "vm_password" {
  for_each     = var.virtual_machines
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}