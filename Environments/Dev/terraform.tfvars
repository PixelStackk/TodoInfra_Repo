rg_details = {
  rg1 = {
    rg_name     = "todo_dev_rg"
    rg_location = "westus"
    tags = {
      Environment = "Dev"
    }
    managed_by = "Brijendra"

  }
}

storage_accounts = {
  stg1 = {
    name                          = "tododevstaorage"
    resource_group_name           = "todo_dev_rg"
    location                      = "westus"
    account_replication_type      = "LRS"
    account_tier                  = "Standard"
    public_network_access_enabled = true
    tags = {
      Environemnts = "Dev"
    }

  }
}

storage_containers = {
  container1 = {
    name                  = "tododevcontainer"
    container_access_type = "private"
    storage_account_name  = "tododevstorage"
    resource_group_name   = "todo_dev_rg"
  }
}
virtual_networks = {
  todo_dev_vnet = {
  name                = "todo_dev_vnet"
  location            = "westus"
  resource_group_name = "todo_dev_rg"
  address_space       = ["10.0.0.0/16"]
  tags = {
    Environemnts = "Dev"
  }
  

  subnets = [
    {
      name             = "forntend_subnet"
      address_prefixes = ["10.1.0.0/24"]
    },

    {
      name             = "backend_subnet"
      address_prefixes = ["10.2.0.0/24"]
    }
  ]
}
}
public_ips = {
  frontend_pip = {
    name                = "todo_frontend_pip"
    location            = "westus"
    resource_group_name = "todo_dev_rg"
    allocation_method   = "Dynamic"
    tags = {
      Environemnts = "Dev"
    }
  }
  backend_pip = {
    name                = "todo_backend_pip"
    location            = "westus"
    resource_group_name = "todo_dev_rg"
    allocation_method   = "Dynamic"
    tags = {
      Environemnts = "Dev"
    }
  }
}
key_vaults = {
  todo_keyvault = {
  name                        = "todo-dev-keyvault"
  location                    = "westus"
  resource_group_name         = "todo_dev_rg"
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  key_permissions             = ["Get", "Delete", "List"]
  secret_permissions          = ["Get", "Delete", "List"]
  storage_permissions         = ["Get", "Delete", "List"]
}
}

key_secrets = {
  secret1 = {
  name                = "Username"
  value               = "Apple"
  kv_name             = "todo_dev_keyvault"
  resource_group_name = "todo_dev_rg"
}
secret2 = {
  name                = "Password"
  value               = "Apple@123"
  kv_name             = "todo_dev_keyvault"
  resource_group_name = "todo_dev_rg"
}
}

mssql_servers = {
  todo_sqlserver = {
  name                         = "tododev-sqlserver"
  location                     = "westus"
  resource_group_name          = "todo-dev_rg"
  version                      = "12.0"
  administrator_login          = "missadmin"
  administrator_login_password = "Apple@123"
  tags = {
    Environment = "Dev"
  }
}
}

sql_database = {
  todo_sqldatabase = {
  name                = "todode-sqldatabase"
  size                = 4
  server_name         = "tododev_sqlserver"
  resource_group_name = "todo-dev_rg"
  tags = {
    Environemnt = "Dev"
  }
}
}
nic = {
  frontend_nic = {
    nic_name             = "frontend_nic"
    location             = "westus"
    resource_group_name  = "todo_dev_rg"
    subnet_name          = "frontend_subnet"
    pip_name             = "frontend_pip"
    virtual_network_name = "todo_dev_vnet"
  }

  backend_nic = {
    nic_name             = "backend_nic"
    location             = "westus"
    resource_group_name  = "todo_dev_rg"
    subnet_name          = "backend_subnet"
    pip_name             = "frontend_pip"
    virtual_network_name = "todo_dev_vnet"
  }
}

virtual_machines = {
  frontend_vm = {
    nic_name            = "frontend_nic"
    resource_group_name = "todo_dev_rg"
    kv_name             = "todo_dev_keyvault"
    vm_name             = "frontend_vm"
    location            = "westus"
    vm_size             = "Standard_DS1_v2"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts"
    version             = "latest"
    disk_name           = "myosdisk1"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    tags = {
      Environement = "Dev"
    }

  }

  backend_vm = {
    nic_name            = "backend_nic"
    resource_group_name = "todo_dev_rg"
    kv_name             = "todo_dev_keyvault"
    vm_name             = "backend_vm"
    location            = "westus"
    vm_size             = "Standard_DS1_v2"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts"
    version             = "latest"
    disk_name           = "myosdisk1"
    caching             = "ReadWrite"
    create_option       = "FromImage"
    managed_disk_type   = "Standard_LRS"
    tags = {
      Environement = "Dev"
    }

  }
}


nsg = {

  todo_nsg = {
  nsg_name            = "todo_dev_nsg"
  location            = "westus"
  resource_group_name = "todo_dev_rg"

  tags = {
    Environement = "Dev"
  }

  security_rules = [
    {
    name                       = "frontend_nsg"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  ]
  }}