resource "azurerm_subnet" "subnetg" {
    for_each = var.subnetg
  name                 = each.value.subnetg_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
}