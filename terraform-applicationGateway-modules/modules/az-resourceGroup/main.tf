resource "azurerm_resource_group" "rgdetails" {
    name = var.resource_group_name
    location = var.location
}