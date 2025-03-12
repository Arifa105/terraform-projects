output "output_private_ip_address" {
    //value = azurerm_windows_virtual_machine.winvm[count.index].private_ip_address
    value = [for vm in azurerm_windows_virtual_machine.winvm : vm.private_ip_address]
  
}