resource "azurerm_virtual_network" "vnetdetails" {
    name = var.virtual_network_name
    resource_group_name = var.resource_group_name
    location = var.location
    address_space = var.address_space
    depends_on = [ var.resource_group_name ]
}
resource "azurerm_subnet" "subnet" {
    count = length(var.subnet_name)
    name = var.subnet_name[count.index]
    virtual_network_name = var.virtual_network_name
    resource_group_name = var.resource_group_name
    address_prefixes = var.address_prefix
    depends_on = [azurerm_virtual_network.vnetdetails]
    }
# resource "azurerm_subnet" "subnet" {
#     count = length(var.subnetdetails)
#     name = var.subnetdetails[0].name
#     resource_group_name =var.resource_group_name
#     virtual_network_name =var.virtual_network_name
#     address_prefixes = var.subnetdetails[0].address_prefixes
#     depends_on = [azurerm_virtual_network.vnetdetails]
# }