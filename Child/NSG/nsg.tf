resource "azurerm_network_security_group" "vm_nsg" {
  name                = "vm-nsg"
  location            = "eastus"
  resource_group_name = "gsss1"

  security_rule {
    name                       = "SSH-Allow"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP-Allow"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_interface_security_group_association" "vm_nic_nsg" {
  network_interface_id      = data.azurerm_network_interface.NICg_nic.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}
data "azurerm_network_interface" "NICg_nic" {
  name                = "NICgs"
  resource_group_name = "gsss1"
}
