resource "azurerm_key_vault_secret" "secret" {
    for_each = var.key_secrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}