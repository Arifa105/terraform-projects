locals{
  resource_group_name = "rg-northcentralus-01"
  location = "North Central US"
  //virtual Network Variables
    virtual_network_name = "vnet-northventralus-01"
    vnet_address_space = ["10.0.0.0/16"]
    subnet_name = ["ApplicationGatewaySubnet","vms-subnet"]
    address_prefix = ["10.0.0.0/24","10.0.1.0/24"]
    count = 2
# virtual_network =[
#   {
#   name = "vnet-northventralus-01"
#   address_space = ["10.254.0.0/16"]
# }] 
# subnet_name1 = ["ApplicationGatewaySubnet", "vms-subnet"]
# subnetapg = [{
#   name = "ApplicationGatewaySubnet"
#   address_prefixes = ["10.254.0.0/24"]
# }]
# subnetvm = [{
#   name = "vm-subnet"
#   address_prefixes = ["10.254.1.0/24"]
# }]

//VM-Public Ip Variables initialization
pip_name = "vm-public_ip"
pip_details_allocation =  "Static"

//VM-NIC variable initialization
nic2 = [{
    nic_name = "vm-nic"
    pip_name ="vm-nic"
    ip_config_name ="internal"
    ip_config_pip = "Dynamic"
    pipdetails_allocation ="Static"
    

}]
//VM Variables initialization
virtual_machine = {
    vm-name = "vm-101"
    admin_username = "adminuser"
    password = "Test123456789"
    storage_account_type = "Standard_LRS"
    vm_size = "Standard_DS2_v2"
    vm_publisher = "MicrosoftWindowsServer"
    vm_sku ="2016-Datacenter"
    versionl ="latest"
    vm_offer = "WindowsServer"
    caching = "ReadWrite"
    config_ip_name = "internal" 
    config_ip_subnet_id_private_ip_allocation = "Dynamic"
}

//nsg  variable initialization
# nsg-details = {
    
# nsg_name= "nsg-101"

# sr_name = "allow-RDP"

# sr_priority  = 100

# sr_direction = "Inbound"

# sr_access = "Allow"

# sr_protocol = "Tcp"

# sr_source_port_range = "*"

# sr_destination_port_range = "3389"

# sr_source_address_prefix =  "*"
   
# sr_destination_address_prefix = "*"
#     }
    
nsg_name= "nsg-101"

sr_name = "allow-RDP"

sr_priority  = 100

sr_direction = "Inbound"

sr_access = "Allow"

sr_protocol = "Tcp"

sr_source_port_range = "*"

sr_destination_port_range = "3389"

sr_source_address_prefix =  "*"
   
sr_destination_address_prefix = "*"


agw_public_ip_name ="my-app-gateway-public-ip"
    aplication_gateway_name  = "my-app-gateway"
    agw_sku_name                 = "Standard_v2"
    aplication_gateway_tier  = "Standard_v2"
    agw_pip_name             = "agw-public-ip"
    agw_frontend_pip_name    = "agw-frontend-ip"
    agw_backendadresspool_name = "agw-backend-pool"
    backend_http_settings_name = "backend-http-settings"
    backend_http_settings_port = 80
    backend_http_settings_protocol = "Http"
    cookie_based_affinity     = "Disabled"
    frontend_port_name       = "frontend-port"
    frontend_port            = 80
    http_listener_name       = "http-listener"
    http_listener_protocol   = "Http"
    routing_rule_name        = "routing-rule"
    routing_rule_type        = "Basic"
    agw_rule_priority = 1

# //pip for apg 
# apgpip = [{
#   pipapg_name = "apg-ip"
#   pip_details_allocation =  "Static"
# }]
# //application Gateway variable initiliaztion
# apg_name = "applicationGatway01"
# sku =[
#   {
#  name           = "Standard_v2"
#  tier           = "Standard_v2"
# capacity =  2
# }] 

# gateway_ip_configuration =[
#   {
# name         = "vnet-gwip-cfg"
# //subnet_id   = ""
# }] 

# frontend_port = [
# {
# name         = "feport"
# port         = 80
# }] 

# frontend_ip_configuration = [
# {
# name         = "feport"
# //public_ip_address_id = 
# }] 

# backend_address_pool = [{
#   name = "vnet-beap"
#   // ip_addresses = [azurerm_windows_virtual_machine.vmdetails.private_ip_address]
# }]

# backend_http_settings =[ {
#         //name                  = "vnet-be-htst"
#         cookie_based_affinity = "Disabled"
#         port                  = 80
#         protocol              = "Http"
#         request_timeout        = 1
#     }]
# http_listener = {
#         //name                        = "vnet-httplstn"
#         //name        = "http-listner"
#         frontend_ip_configuration_name        = "agw-frontend-ip"
#         frontend_port_name                    = "frontend-port"
#         protocol                              = "Http"
#     }
#     request_routing_rule =  {
#         name                       = "agw-rqrt-name"
#         priority = 1
#         rule_type                  = "Basic"
#         http_listener_name         = "http-listener"
#         backend_address_pool_name  = "agw-backend-pool"
#        backend_http_settings_name = "backend-http-settings"
#     }
}
   
