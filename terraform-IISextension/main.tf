
resource "azurerm_resource_group" "rgdetails" {
  for_each = var.resourcedetails

  name     = each.value.rg_name
  location = each.value.location
}

resource "azurerm_virtual_network" "vnetdetails" {
  for_each = var.resourcedetails
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = azurerm_resource_group.rgdetails[each.key].location
  resource_group_name = azurerm_resource_group.rgdetails[each.key].name
  depends_on = [ azurerm_resource_group.rgdetails ]
}

resource "azurerm_subnet" "subnetdetails" {
  for_each = var.resourcedetails

  name                 = each.value.subnet_name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = azurerm_virtual_network.vnetdetails[each.key].name
  resource_group_name  = azurerm_resource_group.rgdetails[each.key].name
  depends_on = [ azurerm_virtual_network.vnetdetails ]
}

resource "azurerm_network_interface" "nicdetails" {
  for_each = var.resourcedetails

  name                = "my-nic"
  location            = azurerm_resource_group.rgdetails[each.key].location
  resource_group_name = azurerm_resource_group.rgdetails[each.key].name
  ip_configuration {
    name                          = "my-ip-config"
    subnet_id                     = azurerm_subnet.subnetdetails[each.key].id
    private_ip_address_allocation = "Dynamic"
     //associate public ip with nic
    public_ip_address_id = azurerm_public_ip.pipdetails[each.key].id
  }
  depends_on = [ azurerm_subnet.subnetdetails ]
}
//Public IP
resource "azurerm_public_ip" "pipdetails" {
  for_each = var.resourcedetails
  name                = "pip01"
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  depends_on = [azurerm_resource_group.rgdetails]
}
resource "azurerm_network_security_group" "nsgdetail" {
  for_each = var.resourcedetails
  name                = "nsg-01"
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [azurerm_resource_group.rgdetails]
}

resource "azurerm_subnet_network_security_group_association" "nsglink" {
for_each = azurerm_network_security_group.nsgdetail
  subnet_id                 = azurerm_subnet.subnetdetails[each.key].id
  network_security_group_id = azurerm_network_security_group.nsgdetail[each.key].id
}

resource "azurerm_windows_virtual_machine" "example" {
  for_each = var.resourcedetails
 name = each.value.name
  resource_group_name = azurerm_resource_group.rgdetails[each.key].name
  location            = azurerm_resource_group.rgdetails[each.key].location
  size                = each.value.size
  admin_username      = "adminuser"
  admin_password      = "arfaVMachine1"
  network_interface_ids = [azurerm_network_interface.nicdetails[each.key].id,]

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
  depends_on = [ azurerm_network_interface.nicdetails, azurerm_resource_group.rgdetails ]
}

# IIS Installation via VM Extension
resource "azurerm_virtual_machine_extension" "iisextension" {
  for_each             = azurerm_windows_virtual_machine.example  # Reference the VM resources here
  name                 = "iis-installation-${each.key}"
  virtual_machine_id   = each.value.id  # Correctly reference the VM ID using each.value
  publisher             = "Microsoft.Compute"
  type                  = "CustomScriptExtension"
  type_handler_version = "1.10"  

  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Add-WindowsFeature Web-Asp-Net45;Add-WindowsFeature NET-Framework-45-Core;Add-WindowsFeature Web-Net-Ext45;Add-WindowsFeature Web-ISAPI-Ext;Add-WindowsFeature Web-ISAPI-Filter;Add-WindowsFeature Web-Mgmt-Console;Add-WindowsFeature Web-Scripting-Tools;Add-WindowsFeature Search-Service;Add-WindowsFeature Web-Filtering;Add-WindowsFeature Web-Basic-Auth;Add-WindowsFeature Web-Windows-Auth;Add-WindowsFeature Web-Default-Doc;Add-WindowsFeature Web-Http-Errors;Add-WindowsFeature Web-Static-Content;"
    } 
SETTINGS
}