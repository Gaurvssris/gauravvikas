resource "azurerm_public_ip" "publicipconf" {
    for_each = var.publicipconf
  name                = each.value.public_ip
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  allocation_method   = "Static"
}