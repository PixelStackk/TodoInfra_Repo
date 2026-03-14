data "azurerm_mssql_server" "mssqlserver" {
    for_each = var.sql_database
    name = each.value.server_name
    resource_group_name = each.value.resource_group_name 
}