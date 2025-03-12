output "virtual_network_output" {
    value = azurerm_virtual_network.vnetdetails.name
}

output "subnet_output" {
    value = azurerm_subnet.subnetdetails.name
}

output "subnetid_output" {
    value = azurerm_subnet.subnetdetails.id
}

