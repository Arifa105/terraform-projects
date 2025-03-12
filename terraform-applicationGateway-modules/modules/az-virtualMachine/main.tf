resource "azurerm_network_interface" "nicdetails" {
    count               = var.vm_count
    name = "${var.nic_name}-${count.index}"
    resource_group_name = var.resource_group_name
    location = var.location
ip_configuration {
      name = "ipconfig-${count.index}"
      subnet_id = var.subnet_id
      private_ip_address_allocation = var.privateip_allocation
      public_ip_address_id = azurerm_public_ip.pipdetails[count.index].id
}
}
resource "azurerm_public_ip" "pipdetails" {
    count = var.vm_count
    name = "pip-${count.index}"
    resource_group_name = var.resource_group_name
    location = var.location
    allocation_method = var.pip_allocation
    depends_on = [ var.resource_group_name ]
}

//NSG configuration 
resource "azurerm_network_security_group" "nsgdetail" {
    count = var.vm_count
    name = "nsg-${count.index}"
    location = var.location
    resource_group_name = var.resource_group_name
    security_rule  {
        name= var.sr_name
        priority = var.sr_priority
        direction = var.sr_direction
        access = var.sr_access
        protocol = var.sr_protocol
        source_port_range = var.sr_source_port_range
        destination_port_range = var.sr_destination_port_range
        source_address_prefix = var.sr_source_port_range
        destination_address_prefix = var.sr_destination_address_prefix
        }
}
resource "azurerm_network_interface_security_group_association" "nsglink" {
    count                       = var.vm_count
    network_interface_id = azurerm_network_interface.nicdetails[count.index].id
    network_security_group_id = azurerm_network_security_group.nsgdetail[count.index].id
}
# Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "winvm" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.password
  network_interface_ids = [azurerm_network_interface.nicdetails[count.index].id]

os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
}
source_image_reference {
    publisher = var.publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version = var.versionl
}
}


