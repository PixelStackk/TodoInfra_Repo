variable "virtual_machines" {
  type = map(object({
    nic_name = string
    resource_group_name = string
    kv_name = string
    vm_name = string
    location = string
    vm_size = string
    publisher = string
    offer     = string
    sku       = string
    version   = string
    disk_name              = string
    caching           = string
    create_option     = string
    managed_disk_type = string
    tags = map(string)
    

  }))
}