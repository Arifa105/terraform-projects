# Public IPs 

resource "azurerm_public_ip" "pip" {  
  count = var.count_value
  name               = "${var.virtualmachine_name}_${count.index}_pip" 
  location           = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static" 

} 

# Network Security Groups 

resource "azurerm_network_security_group" "nsg" { 
  count = var.count_value
  name               = "${var.virtualmachine_name}${var.environment_name}${count.index}" 
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule { 
    name                       = "Allow-RDP" 
    priority                   = 1000 
    direction                  = "Inbound" 
    access                     = "Allow" 
    protocol                   = "Tcp" 
    source_port_range          = "*" 
    destination_port_range     = "3389"  # RDP port 
    source_address_prefix      = "*" 
    destination_address_prefix = "*" 

  } 

} 

# Network Interfaces 

resource "azurerm_network_interface" "nic" { 
  count = var.count_value
  name                = "${var.virtualmachine_name}${var.environment_name}${count.index}-nic" 
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration { 

    name                          = "ipconfig-${count.index}" 
    subnet_id                    = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id         = azurerm_public_ip.pip[count.index].id   

  } 

}

# Virtual Machines 
resource "azurerm_virtual_machine" "vm" { 
  count = var.count_value
  name = "${var.virtualmachine_name}${var.environment_name}${count.index}"
  resource_group_name  = var.resource_group_name
  location             = var.location
  vm_size              = "Standard_DS2_v2" 

  os_profile { 

    computer_name  = var.computer_name  
    admin_username = var.admin_username 
    admin_password = var.admin_password 
    

  } 

   os_profile_windows_config { 
    provision_vm_agent = true
    

  } 
  network_interface_ids = [azurerm_network_interface.nic[count.index].id] 

  storage_os_disk { 

    name            = "${var.virtualmachine_name}${var.environment_name}${count.index}-osdisk" 
    create_option   = "FromImage" 
    caching         = "ReadWrite" 

  } 
  storage_image_reference { 

    publisher = "MicrosoftWindowsServer" 
    offer     = "WindowsServer" 
    sku       = "2016-Datacenter" 
    version   = "latest" 

  } 

} 

resource "azurerm_network_interface_security_group_association" "associateNSG" { 
    count = var.count_value

  network_interface_id    = azurerm_network_interface.nic[count.index].id 

  network_security_group_id = azurerm_network_security_group.nsg[count.index].id 

} 

resource "azurerm_virtual_machine_extension" "iisextension" {
  count = length(azurerm_virtual_machine.vm)
  name                 = "iis-installation-${count.index}"
  virtual_machine_id   =  azurerm_virtual_machine.vm[count.index].id
  publisher             = "Microsoft.Compute"
  type                  = "CustomScriptExtension"
  type_handler_version = "1.10"  

  settings = <<SETTINGS
    { 
      "commandToExecute": "powershell Add-WindowsFeature Web-Asp-Net45;Add-WindowsFeature NET-Framework-45-Core;Add-WindowsFeature Web-Net-Ext45;Add-WindowsFeature Web-ISAPI-Ext;Add-WindowsFeature Web-ISAPI-Filter;Add-WindowsFeature Web-Mgmt-Console;Add-WindowsFeature Web-Scripting-Tools;Add-WindowsFeature Search-Service;Add-WindowsFeature Web-Filtering;Add-WindowsFeature Web-Basic-Auth;Add-WindowsFeature Web-Windows-Auth;Add-WindowsFeature Web-Default-Doc;Add-WindowsFeature Web-Http-Errors;Add-WindowsFeature Web-Static-Content;"
    } 
SETTINGS
}

  
