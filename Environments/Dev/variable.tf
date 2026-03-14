variable "rg_details" {
  type = map(object({
    rg_name     = string
    rg_location = string
    tags        = map(string)
    managed_by  = string

  }))
}

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

variable "storage_containers" {
  type = map(object({
    name                  = string
    container_access_type = string
    storage_account_name  = string
    resource_group_name   = string


  }))

}

variable "virtual_networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))

    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "public_ips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    tags                = map(string)

  }))
}

variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    sku_name                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    key_permissions             = list(string)
    secret_permissions          = list(string)
    storage_permissions         = list(string)
  }))
}
variable "key_secrets" {
  type = map(object({
    name                = string
    value               = string
    kv_name             = string
    resource_group_name = string

  }))

}

variable "mssql_servers" {
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    tags                         = map(string)
  }))
}

variable "sql_database" {
  type = map(object({
    name                = string
    size                = number
    tags                = map(string)
    server_name         = string
    resource_group_name = string
  }))
}
variable "nic" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    pip_name             = string
    virtual_network_name = string
  }))
}

variable "virtual_machines" {
  type = map(object({
    nic_name            = string
    resource_group_name = string
    kv_name             = string
    vm_name             = string
    location            = string
    vm_size             = string
    publisher           = string
    offer               = string
    sku                 = string
    version             = string
    disk_name           = string
    caching             = string
    create_option       = string
    managed_disk_type   = string
    tags                = map(string)


  }))
}

variable "nsg" {

  description = "Network Security Group configuration"

  type = map(object({

    nsg_name            = string
    location            = string
    resource_group_name = string

    tags = map(string)

    security_rules = list(object({

      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string

    }))

  }))

}