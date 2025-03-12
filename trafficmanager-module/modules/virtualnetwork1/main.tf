resource "azurerm_virtual_network" "vnet" {
    name = var.virtual_network_name
    location= var.vnet_location
    resource_group_name = var.resource_group_name
    address_space = var.vnet_address_space

    
  
}


resource "azurerm_subnet" "subnet" {
    for_each = toset(var.subnet_name)
    name = each.key
    virtual_network_name = var.virtual_network_name
    resource_group_name = var.resource_group_name
    address_prefixes = [cidrsubnet(var.vnet_cidr, 8, index(var.subnet_name, each.key))]
    
}