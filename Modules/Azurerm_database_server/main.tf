resource "azurerm_mssql_server" "mssqlserver" {
  for_each                     = var.mssql_servers
  name                         = each.value.name
  location                     = each.value.location
  resource_group_name          = each.value.resource_group_name
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  tags                         = each.value.tags
  
}

