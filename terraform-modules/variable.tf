variable "resource_group_name" {
    type = string
    default = "rg-101"
  
}
variable "location" {
    type = string
    default = "northcentralus"
   
}
variable "virtual_network_name" {
    type = string
    default = "vnet-101"
    }
variable "address_space" {
    type = list(string)
   default = ["10.0.1.0/24"]
  
}
variable "subnet_name" {
    type = string
    default = "subnet-101"
  
}
variable "subnet_address_prefix" {
    type = list(string)
     default = ["10.0.0.0/16"]
  
}
variable "nic_name" {
    type = string
    default = "nic-101"
}
variable "pip_name" {
    type = string
    default = "pip-101"
}
variable "nsg_name" {
    type = string
    default = "nsg-101"
  
}
variable "vm_name" {
    type = string
    default = "rm-101"
}
variable "admin_username" {
    type = string 
    default = "admin-101"
}
variable "password" {
    type = string
    default = "Test1234567890"
  
}
variable "storage_account_type" {
    type = string
    default = "Standard_LRS"
  
}
variable "vm_size" {
    type = string
    default = "Standard_DS2_v2"
    }
variable "vm_publisher" {
    type = string
    default = "MicrosoftWindowsServer"
    }
variable "vm_sku" {
    type = string
    default = "2016-Datacenter"
}
variable "versionl" {
    type = string
    default = "latest"
  
}
variable "vm_offer" {
    type = string
    default = "WindowsServer"
    }

variable "caching" {
    type = string
    default = "ReadWrite"
  
}
variable "ip_config_name" {
    type = string
    default = "internal"
  
}
variable "ip_config_pip" {
    type = string
    default = "Dynamic"
  
}
variable "pipdetails_allocation" {
    type = string
    default = "Static"
}
variable "sr-name" {
    type = string
    default = "allow-RDP"
  
}
variable "sr_priority" {
    type = number
    default = 100
}
variable "sr_direction" {
    type = string
    default = "Inbound"
  
}
variable "sr_access" {
    type = string
    default = "Allow"
  
}
variable "sr_protocol" {
    type = string
    default = "Tcp"
  
}
variable "sr_source_port_range" {
    type = string
    default = "*"
  
}
variable "sr_destination_port_range" {
    type = string
    default = "3389"
  
}
variable "sr_source_address_prefix" {
    type = string
    default = "*"
    }
 variable "sr_destination_address_prefix" {
    type = string
    default = "*"
    }


