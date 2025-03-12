resource "azurerm_network_interface" "nicdetails" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.pip_allocation_method
    public_ip_address_id = var.pip_id
    
  }
  depends_on= [var.subnet_id]
}
