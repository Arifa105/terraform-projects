output "apgw_id" {
    value = azurerm_application_gateway.agw.id
  
}

output "public_ip_agw_1" {
    value = azurerm_public_ip.agw_public_ip.ip_address
  
}



# // apg_name
# output "apgname_out" {
#     value = azurerm_application_gateway.apgdetails.name
# }

# output "output_public_ip" {
#     value = azurerm_public_ip.agw_public_ip.id
  
# }