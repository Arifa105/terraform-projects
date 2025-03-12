# output "vnetname_output" {
#     value = azurerm_virtual_network.vnetdetails.name
# }

# # output "subnetapgname_output" {
# #     value = azurerm_subnet.subnet[0].name
# # }
# output "subnetapgid_output" {
#     value = azurerm_subnet.subnet[0].id
# }
# # output "subnetvmname_output" {
# #     value = azurerm_subnet.subnet[1].name
# # }
# output "subnetvmid_output" {
#     value = azurerm_subnet.subnet[1].id
# }


output "virtual_network_name" {
   value = azurerm_virtual_network.vnetdetails.name
}
output "applicationgateway_subnet_id" {
    value = azurerm_subnet.subnet[0].id

}
output "vms_subnet_id" {
    value = azurerm_subnet.subnet[1].id
}
