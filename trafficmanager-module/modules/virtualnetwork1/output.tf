output "virtual_network_name" {
   description = "The name of the virtual network"
   value = azurerm_virtual_network.vnet.name
  
}


output "applicationgateway_subnet_id" {

  value = azurerm_subnet.subnet ["ApplicationGatewaySubnet"].id

}
  
output "vms_subnet_id" {

  value = azurerm_subnet.subnet ["vms-subnet"].id

}


# output "vms2_subnet_id" {

#   value = azurerm_subnet.subnet ["vms2-subnet"].id

# }