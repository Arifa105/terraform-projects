variable "virtual_network_name" {
    type = string
  
}

variable "resource_group_name" {
    type =  string
  
}

variable "vnet_location" {
    type = string
  
}

variable "vnet_address_space" {
    type = list(string) 
  
}


variable "subnet_name" {
    type = list(string) 
  
}


variable "vnet_cidr" {
    type = string 
  
}
