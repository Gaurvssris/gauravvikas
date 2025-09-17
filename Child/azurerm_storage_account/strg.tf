resource "azurerm_storage_account" "strggsss" {
    for_each = var.strg
  name                     = each.value.strg
  resource_group_name      = each.value.rg_name
  location                 = each.value.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}