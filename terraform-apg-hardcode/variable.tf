
variable "resource_group" {
    type = string
    default = "apg-rg"
}

variable "hostname" {
    type = string
    default = "compute"
	
}

# variable "dns_name" {
	
# }
variable "location" {
     type = string
     default     = "northcentralus"
}

variable "virtual_network_name" {
     type = string
     default     = "vnet"
}

variable "vm_size" {
     type = string
     default     = "Standard_A0"
}

variable "image_publisher" {
     type = string
     default     = ""
}

variable "image_offer" {
	
	default     = ""
}

variable "image_sku" {
	
	default     = ""
}

variable "image_version" {
	
	default     = ""
}

variable "username" {
    type = string
    default     = "testadmin"
}

variable "password" {
    type = string
    default		= "Test123456789"
}

