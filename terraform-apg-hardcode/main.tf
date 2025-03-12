//Resource Group
resource "azurerm_resource_group" "rg" {
    name     = "${var.resource_group}"
    location = "${var.location}"
}
//virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "${var.virtual_network_name}-apg"
    location            = "${azurerm_resource_group.rg.location}"
    address_space       = ["10.254.0.0/16"]
    resource_group_name = "${azurerm_resource_group.rg.name}"
}
//gateway subnet
resource "azurerm_subnet" "subnet" {
    name                 = "${azurerm_resource_group.rg.name}-subnet"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    address_prefixes       = ["10.254.0.0/24"]
}
//app gateway publicip
resource "azurerm_public_ip" "pip" {
    name                         = "${azurerm_resource_group.rg.name}-ip"
    location                     = "${azurerm_resource_group.rg.location}"
    resource_group_name          = "${azurerm_resource_group.rg.name}"
    allocation_method =  "Static"
}
//application gateway configuration
resource "azurerm_application_gateway" "network" {
    name                = "${azurerm_virtual_network.vnet.name}"
    location            = "${azurerm_resource_group.rg.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    sku {
        name           = "Standard_v2"
        tier           = "Standard_v2"
        capacity       = 2
    }
    gateway_ip_configuration {
        name         = "${azurerm_virtual_network.vnet.name}-gwip-cfg"
        subnet_id    = "${azurerm_subnet.subnet.id}"
    }
    frontend_port {
        name         = "${azurerm_virtual_network.vnet.name}-feport"
        port         = 80
    }
    frontend_ip_configuration {
        name         = "${azurerm_virtual_network.vnet.name}-feip"  
        public_ip_address_id = "${azurerm_public_ip.pip.id}"
    }
    backend_address_pool {
        name = "${azurerm_virtual_network.vnet.name}-beap"
        ip_addresses = [azurerm_windows_virtual_machine.vmdetails.private_ip_address]
        //ip_address_list = ["${element(azurerm_network_interface.nic.*.private_ip_address, count.index)}"] 
    }
    backend_http_settings {
        name                  = "${azurerm_virtual_network.vnet.name}-be-htst"
        cookie_based_affinity = "Disabled"
        port                  = 80
        protocol              = "Http"
        request_timeout        = 1
    }
    http_listener {
        name                                  = "${azurerm_virtual_network.vnet.name}-httplstn"
        frontend_ip_configuration_name        = "${azurerm_virtual_network.vnet.name}-feip"
        frontend_port_name                    = "${azurerm_virtual_network.vnet.name}-feport"
        protocol                              = "Http"
    }
    request_routing_rule {
        name                       = "${azurerm_virtual_network.vnet.name}-rqrt"
        priority = 9
        rule_type                  = "Basic"
        http_listener_name         = "${azurerm_virtual_network.vnet.name}-httplstn"
        backend_address_pool_name  = "${azurerm_virtual_network.vnet.name}-beap"
        backend_http_settings_name = "${azurerm_virtual_network.vnet.name}-be-htst"
    }
}

resource "azurerm_network_interface" "nic" {
    name                = "${azurerm_resource_group.rg.name}-nic"
    location            = "${azurerm_resource_group.rg.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"

    ip_configuration {
        name                          = "${azurerm_resource_group.rg.name}-ipconfig"
        subnet_id                     = "${azurerm_subnet.subnet2.id}"
        private_ip_address_allocation = "Dynamic"
        private_ip_address            = "10.254.1.4"
    }
}
//vm subnet
resource "azurerm_subnet" "subnet2" {
    name                 = "${azurerm_resource_group.rg.name}-subnet2"
    virtual_network_name = "${azurerm_virtual_network.vnet.name}"
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    address_prefixes      = ["10.254.1.0/24"]
}

resource "azurerm_network_interface" "vmnic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "vmpip" {
    name                         = "${azurerm_resource_group.rg.name}-vm-pip"
    resource_group_name          = "${azurerm_resource_group.rg.name}"
    location                     = "${azurerm_resource_group.rg.location}"
    allocation_method =   "Static"
    domain_name_label            = "${azurerm_resource_group.rg.name}-vm"
}

resource "azurerm_network_security_group" "nsg" {
    name                = "${azurerm_resource_group.rg.name}-vm-nsg"
    location            = "${azurerm_resource_group.rg.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"

    security_rule {
        name                       = "allow_rdp_in_all"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}


resource "azurerm_windows_virtual_machine" "vmdetails" {
  name                = "vm-machine"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_DS2_v2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.vmnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

# # Windows Virtual Machine
# resource "azurerm_windows_virtual_machine" "win-vm" {
#   name                = "${azurerm_resource_group.rg.name}-vm"
#   resource_group_name = "${azurerm_resource_group.rg.name}"
#   location            = "${azurerm_resource_group.rg.location}"
#   size                = "${var.vm_size}"
#   admin_username =  "${var.username}"
#    admin_password = "${var.password}"  
#   network_interface_ids = ["${azurerm_network_interface.nic.id}"]
# os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
# source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2016-Datacenter"
#     version   = "latest"
#   }
# }



