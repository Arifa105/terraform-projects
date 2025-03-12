variable "virtual_network_name" {
    type = string
}
variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string
}

variable "address_space" {
    type = list(string)
}
variable "subnet_name" {
    type = list(string) 
 }

 variable "address_prefix" {
    type = list(string )
  
}
# variable "subnetdetails" {
#   type = list(object({
#     name= string 
#     address_prefixes = list(string)
# }))
# }



