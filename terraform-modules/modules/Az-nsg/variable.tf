
variable "nsg_name" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string
}
variable "subnet_id" {
    type = string
  
}
variable "sr-name" {
    type = string
}
variable "sr_priority" {
    type = number
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


