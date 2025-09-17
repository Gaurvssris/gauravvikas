resource "azurerm_network_interface" "NICG" {
    for_each = var.NICG
  name                = each.value.NIC_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetdata.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.data_public_ip.id
     }
}
data "azurerm_subnet" "subnetdata" {
  name                 = "subnetgss"
  virtual_network_name = "vnetgsss"
  resource_group_name  = "gsss1"
  }
  data "azurerm_public_ip" "data_public_ip" {
  name                = "pubgss"
  resource_group_name = "gsss1"
}