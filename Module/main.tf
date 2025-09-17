module "rg" {
  source = "../Child/azurerm_resource_group"
rg = var.rggs

}
module "strg" {
  depends_on = [ module.rg ]
  source = "../Child/azurerm_storage_account"
strg = var.strg

}
module "vnetg" {
  depends_on = [ module.rg ]
  source = "../Child/azurerm_virtual_network"
  vnetg = var.vnetsg
  
}
module "subnetg" {
  depends_on = [ module.vnetg ]
  source = "../Child/azurerm_Subnet"
  subnetg = var.subnetgs
  
}
module "NICG" {
  depends_on = [ module.subnetg, module.publicipconf ]
  source = "../Child/azurerm_NIC"
  NICG = var.NICg
  
}
module "publicipconf" {
  depends_on = [ module.subnetg ]
  source = "../Child/public_ip"
  publicipconf = var.public_ip
  
}
module "vm" {
  depends_on = [ module.NICG ]
  source = "../Child/azurerm_virtual_machine"
  vm = var.vmgsssg
  
}
module "NSG" {
  depends_on = [ module.NICG ]
  source = "../Child/NSG"
  
}