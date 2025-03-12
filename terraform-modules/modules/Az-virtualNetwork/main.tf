resource "azurerm_virtual_network" "vnetdetails"{
  name                = "vnet-${var.virtual_network_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  depends_on = [ var.resource_group_name ]
 
}
resource "azurerm_subnet" "subnetdetails" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes       = var.subnet_address_prefix
  depends_on = [var.virtual_network_name]
 
}