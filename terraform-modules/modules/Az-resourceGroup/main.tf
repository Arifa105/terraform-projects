resource "azurerm_resource_group" "rgdeatils" {
    name = "rg-${var.resource_group_name}"
    location = var.location
}