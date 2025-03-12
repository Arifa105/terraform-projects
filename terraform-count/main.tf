resource "azurerm_resource_group" "rgdetails" {
  count = length(var.resourcedetails)

  name     = (var.resourcedetails[count.index].rg_name)
  location = (var.resourcedetails[count.index].location)
}

resource "azurerm_virtual_network" "vnetdetails" {
  count = length(var.resourcedetails)

  name                = var.resourcedetails[count.index].vnet_name
  address_space       = var.resourcedetails[count.index].address_space
  location            = azurerm_resource_group.rgdetails[count.index].location
  resource_group_name = azurerm_resource_group.rgdetails[count.index].name
  depends_on = [ azurerm_resource_group.rgdetails ]
}

resource "azurerm_subnet" "subnetdetails" {
  count = length(var.resourcedetails)

  name                 = var.resourcedetails[count.index].subnet_name
  address_prefixes     = var.resourcedetails[count.index].address_prefixes
  virtual_network_name = azurerm_virtual_network.vnetdetails[count.index].name
  resource_group_name  = azurerm_resource_group.rgdetails[count.index].name
  depends_on = [ azurerm_virtual_network.vnetdetails ]
}

resource "azurerm_network_interface" "nicdetails" {
  count = length(var.resourcedetails)

  name                = "my-nic"
  location            = azurerm_resource_group.rgdetails[count.index].location
  resource_group_name = azurerm_resource_group.rgdetails[count.index].name
  ip_configuration {
    name                          = "my-ip-config"
    subnet_id                     = azurerm_subnet.subnetdetails[count.index].id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [ azurerm_subnet.subnetdetails ]
}

resource "azurerm_virtual_machine" "vmdetails" {
  count = length(var.resourcedetails)

  name                  = var.resourcedetails[count.index].name
  location              = azurerm_resource_group.rgdetails[count.index].location
  resource_group_name   = azurerm_resource_group.rgdetails[count.index].name
  network_interface_ids = [azurerm_network_interface.nicdetails[count.index].id]
  vm_size               = var.resourcedetails[count.index].size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.resourcedetails[count.index].name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.resourcedetails[count.index].name
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  depends_on = [ azurerm_network_interface.nicdetails, azurerm_resource_group.rgdetails ]
}


