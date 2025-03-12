resource "azurerm_public_ip" "pipdetails" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.pipdetails_allocation
  depends_on = [var.resource_group_name]
}