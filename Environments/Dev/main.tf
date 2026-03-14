module "resource_group" {
  source     = "../../modules/azurerm_resource_group"
  rg_details = var.rg_details
}
module "storage_account" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
}
module "storage_container" {
  depends_on         = [module.storage_account]
  source             = "../../modules/azurerm_storage_container"
  storage_containers = var.storage_containers

}
module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_networks"
  virtual_networks = var.virtual_networks
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}
module "key_secrets" {
  depends_on  = [module.key_vault]
  source      = "../../modules/azurerm_key_vault_secret"
  key_secrets = var.key_secrets
}
module "mssql_server" {
  depends_on    = [module.resource_group]
  source        = "../../modules/azurerm_database_server"
  mssql_servers = var.mssql_servers
}
module "mssql_database" {
  depends_on   = [module.mssql_server]
  source       = "../../modules/azurerm_mssql_database"
  sql_database = var.sql_database
}
module "network_interface" {
  depends_on = [module.public_ip, module.virtual_network]
  source     = "../../modules/azurerm_network_interface"
  nic        = var.nic
}
module "virtual_machines" {
  depends_on       = [module.virtual_network, module.public_ip, module.network_interface, module.key_secrets]
  source           = "../../modules/azurerm_compute"
  virtual_machines = var.virtual_machines
}
module "network_security_group" {
  depends_on = [module.virtual_network]
  source     = "../../Modules/Azurerm_Network_Group"
  nsg        = var.nsg
}

