output "vm_1_private_ip" {
  value = azurerm_network_interface.nic[0].ip_configuration[0].private_ip_address
}

output "vm_2_private_ip" {
  value = azurerm_network_interface.nic[1].ip_configuration[0].private_ip_address
}

output "vm_3_private_ip" {
  value = azurerm_network_interface.nic[0].ip_configuration[0].private_ip_address
}

output "vm_4_private_ip" {
  value = azurerm_network_interface.nic[1].ip_configuration[0].private_ip_address
}