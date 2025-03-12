
variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string
}
variable "vm_count" {
  type        = number
}
variable "vm_name" {
    type = string
}
variable "pip_name" {
    type = string
}
variable "pip_allocation" {
    type = string
}

variable "nic_name" {
    type = string
}
variable "admin_username" {
    type = string 
}
variable "password" {
    type = string
}
variable "storage_account_type" {
    type = string
}
variable "size" {
    type = string
    }
variable "publisher" {
    type = string
    }
variable "vm_sku" {
    type = string
}
variable "versionl" {
    type = string
  
}
variable "vm_offer" {
    type = string
}
variable "caching" {
    type = string
}
variable "conf_ip_name" {
    type = string
}
variable "subnet_id" {
    type = string
}
variable "privateip_allocation" {
    type = string
}
// NSG variables
variable "nsg_name" {
    type = string
}
variable "sr_name" {
    type = string
}
variable "sr_priority" {
    type = string
}
variable "sr_direction" {
    type = string
}
variable "sr_access" {
    type = string
}
variable "sr_protocol" {
    type = string
}
variable "sr_source_port_range" {
    type = string
}
variable "sr_destination_port_range" {
    type = string
}
variable "sr_source_address_prefix" {
    type = string
}
 variable "sr_destination_address_prefix" {
    type = string
}
