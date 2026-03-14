resource "azurerm_virtual_machine" "vm" {
  for_each = var.virtual_machines
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  vm_size               = each.value.vm_size
  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  storage_os_disk {
    name              = each.value.disk_name
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
    os_profile {
  computer_name = "DevOps_Machine"
  admin_username = data.azurerm_key_vault_secret.vm_username[each.key].value
  admin_password = data.azurerm_key_vault_secret.vm_password[each.key].value
  }
 os_profile_linux_config {
    disable_password_authentication = false
 }
  tags = each.value.tags
}

