module "resourcegroup" {
    source = "./modules/resourcegroup"
    resource_group_name = local.resource_group_name
    location = local.location
}

module "virtualnetwork1" {
    source = "./modules/virtualnetwork1"
    virtual_network_name = local.virtual_network_name
    resource_group_name = module.resourcegroup.resource_group_name
    vnet_location = local.location
    vnet_address_space = local.vnet_address_space
    subnet_name = local.subnet_name
    vnet_cidr = local.vnet_cidr

    depends_on = [module.resourcegroup.resource_group_name ]

  
}

 module "virtualnetwork2" {
    source = "./modules/virtualnetwork1"
    virtual_network_name = local.virtual_network_name2
    resource_group_name = module.resourcegroup.resource_group_name
    vnet_location = local.location2
    vnet_address_space = local.vnet_address_space2
    subnet_name = local.subnet_name
    vnet_cidr = local.vnet_cidr2
    depends_on = [module.virtualnetwork1.virtual_network_name]

}

module "virtualmachine" {
    source = "./modules/virtualmachine"
    virtualmachine_name = local.virtualmachine_name
    location = module.resourcegroup.resource_group_location
    resource_group_name = module.resourcegroup.resource_group_name
    environment_name = local.environment_name 
    admin_username = local.admin_username
    admin_password = local.admin_password
    computer_name = local.computer_name
    count_value =  local.count_value
    subnet_id = module.virtualnetwork1.vms_subnet_id

}

module "virtualmachine2" {
    source = "./modules/virtualmachine"
    virtualmachine_name = local.virtualmachine_name_2
    location = local.location2
    resource_group_name = module.resourcegroup.resource_group_name
    environment_name = local.environment_name 
    admin_username = local.admin_username
    admin_password = local.admin_password
    computer_name = local.computer_name
    count_value =  local.count_value
    subnet_id = module.virtualnetwork2.vms_subnet_id

}

module "applicationgateway" {
    source = "./modules/applicationgateway"
    //dns_zone_name = local.dns_zone_name
    agw_public_ip_name = local.agw_public_ip_name
    aplication_gateway_name   = local.aplication_gateway_name
    location = local.location
    resource_group_name = module.resourcegroup.resource_group_name
    sku_name = local.agw_sku_name
    aplication_gateway_tier = local.aplication_gateway_tier
    agw_pip_name = local.agw_pip_name
    subnet_id = module.virtualnetwork1.applicationgateway_subnet_id
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
    vms_privateip = [module.virtualmachine.vm_1_private_ip, module.virtualmachine.vm_2_private_ip]
    
  
}


module "applicationgateway2" {
    source = "./modules/applicationgateway"
     //dns_zone_name = local.dns_zone_name2
    agw_public_ip_name = local.agw_public_ip_name2
    aplication_gateway_name   = local.aplication_gateway_name2
    location = local.location2
    resource_group_name = module.resourcegroup.resource_group_name
    sku_name = local.agw_sku_name
    aplication_gateway_tier = local.aplication_gateway_tier
    agw_pip_name = local.agw_pip_name
    subnet_id = module.virtualnetwork2.applicationgateway_subnet_id
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
    agw_rule_priority = local.agw_rule_priority_2
    vms_privateip = [module.virtualmachine2.vm_3_private_ip, module.virtualmachine2.vm_4_private_ip]

  
}


module "trafficmanager" {
    source = "./modules/trafficmanager"
    traffic_manager_name = local.traffic_manager_name
    location =  local.location
    resource_group_name =  module.resourcegroup.resource_group_name
    traffic_routing_method = local.traffic_routing_method
    port_value = local.port_value
    protocol = local.protocol
    dns_name = local.dns_name
    ttl = local.ttl

  
}

module "endpoint1" {
    source = "./modules/endpoint"
    endpoint_name = local.endpoint_name
    target_id = module.applicationgateway.public_ip_agw_1
    profile_id = module.trafficmanager.traffic_manager-profileid
    priority = local.priority
  
}

module "endpoint2" {
    source = "./modules/endpoint"
    endpoint_name = local.endpoint_name2
    target_id = module.applicationgateway2.public_ip_agw_2
    profile_id = module.trafficmanager.traffic_manager-profileid
    priority = local.priority2
  
}

