resource "azurerm_linux_virtual_machine" "vmgss" {
    for_each = var.vm
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password = "gaurav@123"
  network_interface_ids = [
    data.azurerm_network_interface.NICg_nic.id
    
  ]
disable_password_authentication = false
 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
data "azurerm_network_interface" "NICg_nic" {
  name                = "NICgs"
  resource_group_name = "gsss1"
}