resource "azurerm_network_security_group" "nsgdetail" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = var.sr-name
    priority                   = var.sr_priority
    direction                  = var.sr_direction
    access                     = var.sr_access
    protocol                   = var.sr_protocol
    source_port_range          = var.sr_source_port_range
    destination_port_range     = var.sr_destination_port_range
    source_address_prefix      = var.sr_source_port_range
    destination_address_prefix = var.sr_destination_address_prefix
  }
  depends_on = [var.resource_group_name]
}

resource "azurerm_subnet_network_security_group_association" "nsglink" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsgdetail.id
}