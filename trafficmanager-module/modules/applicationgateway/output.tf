output "apgw_id" {
    value = azurerm_application_gateway.agw.id
  
}

output "public_ip_agw_1" {
    value = azurerm_public_ip.agw_public_ip.ip_address
  
}

output "public_ip_agw_2" {
    value = azurerm_public_ip.agw_public_ip.ip_address
  
}