//Resource Group
module "resourcegroup" {
  source = "./modules/az-resourceGroup"
  resource_group_name = local.resource_group_name
  location = local.location
}
//virtual Network configuration
module "virtualnetwork" {
  source = "./modules/az-virtualNetwork"
  virtual_network_name= local.virtual_network_name
  location = module.resourcegroup.location_output
  resource_group_name= module.resourcegroup.rg_output
  address_space = local.vnet_address_space
  subnet_name = local.subnet_name
  address_prefix = local.address_prefix
}
//Virtual Machine Configuration
   module "virtualmachine" {
    source = "./modules/az-virtualMachine"
    resource_group_name = module.resourcegroup.rg_output
    location = module.resourcegroup.location_output
    vm_count = local.count
    vm_name = local.virtual_machine.vm-name
    pip_name =  local.pip_name
    pip_allocation = local.pip_details_allocation
    nic_name = local.nic2[0].nic_name
    size = local.virtual_machine.vm_size
    admin_username = local.virtual_machine.admin_username
    password = local.virtual_machine.password
    caching = local.virtual_machine.caching
    conf_ip_name = local.virtual_machine.config_ip_name
    privateip_allocation = local.virtual_machine.config_ip_subnet_id_private_ip_allocation
    storage_account_type = local.virtual_machine.storage_account_type
    publisher = local.virtual_machine.vm_publisher
    vm_offer = local.virtual_machine.vm_offer
    vm_sku = local.virtual_machine.vm_sku
    versionl = local.virtual_machine.versionl
    subnet_id = module.virtualnetwork.vms_subnet_id
    nsg_name = local.nsg_name
    sr_name = local.sr_name
    sr_priority = local.sr_priority
    sr_direction = local.sr_direction
    sr_access = local.sr_access
    sr_protocol = local.sr_protocol
    sr_source_port_range = local.sr_source_port_range
    sr_destination_port_range = local.sr_destination_port_range
    sr_source_address_prefix = local.sr_source_address_prefix
    sr_destination_address_prefix=  local.sr_destination_address_prefix
}

module "apgConfiguration" {
  source = "./modules/az-applicationGateway"
    agw_public_ip_name = local.agw_public_ip_name
    aplication_gateway_name   = local.aplication_gateway_name
    location = module.resourcegroup.location_output
    resource_group_name = module.resourcegroup.rg_output
    sku_name = local.agw_sku_name
    aplication_gateway_tier = local.aplication_gateway_tier
    agw_pip_name = local.agw_pip_name
    subnet_id = module.virtualnetwork.applicationgateway_subnet_id
    agw_frontend_pip_name =  local.agw_frontend_pip_name
    agw_backendadresspool_name =  local.agw_backendadresspool_name
    backend_http_settings_name = local.backend_http_settings_name
    backend_http_settings_port = local.backend_http_settings_port
    backend_http_settings_protocol = local.backend_http_settings_protocol
    cookie_based_affinity = local.cookie_based_affinity
    frontend_port_name = local.frontend_port_name
    frontend_port = local.frontend_port
    http_listener_name = local.http_listener_name
    http_listener_protocol = local.backend_http_settings_protocol 
    routing_rule_name = local.routing_rule_name
    routing_rule_type = local.routing_rule_type
    agw_rule_priority = local.agw_rule_priority
    //vms_privateip = [module.virtualmachine2.vm_3_private_ip, module.virtualmachine2.vm_4_private_ip]

  
}

#  //Application gateway configuration
#   module "apgConfiguration" {
#     source = "./modules/az-applicationGateway"
#     pipagw_name  =local.apgpip[0].pipapg_name 
#     resource_group_name =  module.resourcegroup.rg_output
#     location            = module.resourcegroup.location_output
#     pip_details_allocation = local.apgpip[0].pip_details_allocation
#     apg_name = local.apg_name
#     virtual_network_name = module.virtualnetwork.vnetname_output
#     skuapg = [{
#       name = local.sku[0].name
#       tier = local.sku[0].tier
#       capacity =local.sku[0].capacity
#     }]
#     gateway_ip = [{
#       name =  local.gateway_ip_configuration[0].name
#       subnet_id = module.virtualnetwork.subnetapgid_output

#     }]
#   fe_port = [{
#     name =  local.frontend_port[0].name
#     port  =  local.frontend_port[0].port

#   }]
# agw_fe_ip_config = [{
#      name = local.frontend_ip_configuration [0].name
#     public_ip_address_id = module.apgConfiguration.output_public_ip
# }]
# //backened_pool
# be_address_pool = [{
#   name =  local.backend_address_pool[0].name
#  //vms_privateip = [module.virtualmachine.output_private_ip_address]
#  }]
# be_http_settings = [{
#      name= local.request_routing_rule.backend_http_settings_name
#      cookie_based_affinity =local.backend_http_settings[0].cookie_based_affinity 
#      port = local.backend_http_settings[0].port
#      prtcl= local.backend_http_settings[0].protocol
#      request_timeout = local.backend_http_settings[0].request_timeout
#   }]
#    http_listener = [{
#     //name = local.http_listener.name
#     frontend_ip_configuration_name = local.http_listener.frontend_ip_configuration_name 
#     frontend_port_name= local.http_listener.frontend_port_name
#     prtcl= local.http_listener.protocol

#    }]
#     req_rout_rule = [
#   {
#     name                        = local.request_routing_rule.name
#     priority                    = local.request_routing_rule.priority
#     rule_type                   = local.request_routing_rule.rule_type
#     http_listener_name          = local.request_routing_rule.http_listener_name 
#     backend_address_pool_name   = local.request_routing_rule.backend_address_pool_name
#     backend_http_settings_name  = local.request_routing_rule.backend_http_settings_name
#   }
# ]
#   }

