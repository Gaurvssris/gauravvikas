resource "azurerm_virtual_network" "vnetg" {
    for_each = var.vnetg
  name                = each.value.vnet_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  address_space       = ["10.0.0.0/16"]
  
}