resource "azurerm_mssql_database" "tododatabase" {
  for_each     = var.sql_database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.mssqlserver[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.size
  sku_name     = "S0"
  enclave_type = "VBS"
  tags         = each.value.tags
  lifecycle {
    prevent_destroy = true
  }
}
