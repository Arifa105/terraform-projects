# Define the Public IP resource
resource "azurerm_public_ip" "agw_public_ip" {
  name                = var.agw_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                  = "Standard" 
  domain_name_label = "my-app-gateway"
}


resource "azurerm_application_gateway" "agw" {
    name = var.aplication_gateway_name
    resource_group_name = var.resource_group_name
    location =var.location
    sku {
        name = var.sku_name
        tier = var.aplication_gateway_tier
         capacity = 2
      
    }
     gateway_ip_configuration {
        name = var.agw_pip_name
        subnet_id = var.subnet_id
      
      
    }

    frontend_ip_configuration {
        name = var.agw_frontend_pip_name
        public_ip_address_id      = azurerm_public_ip.agw_public_ip.id
        
      
    }
    backend_address_pool {
        name = var.agw_backendadresspool_name
        //ip_addresses = var.vms_privateip

    
      
    }
    backend_http_settings {
        name = var.backend_http_settings_name
        port =var.backend_http_settings_port
        protocol = var.backend_http_settings_protocol
        cookie_based_affinity = var.cookie_based_affinity
      
    }
    frontend_port {
        name = var.frontend_port_name
        port = var.frontend_port
      
    }
     http_listener {
       
        name = var.http_listener_name
        protocol = var.http_listener_protocol
        frontend_port_name = var.frontend_port_name
        frontend_ip_configuration_name = var.agw_frontend_pip_name

    }
       request_routing_rule {
        name = var.routing_rule_name
        rule_type = var.routing_rule_type
        priority = var.agw_rule_priority
        http_listener_name =   var.http_listener_name
        backend_address_pool_name =  var.agw_backendadresspool_name
        backend_http_settings_name = var.backend_http_settings_name

      
    }
      }
# resource "azurerm_public_ip" "agw_public_ip" {
#     name = var.pipagw_name
#     resource_group_name = var.resource_group_name
#     location = var.location
#     allocation_method = var.pip_details_allocation
#     sku                  = "Standard" 
#     domain_name_label = "my-app-gateway"
#     depends_on = [var.resource_group_name ]
# }
# //application gateway configuration
# resource "azurerm_application_gateway" "apgdetails" {
#     name                = var.apg_name
#     location            = var.location
#     resource_group_name = var.resource_group_name
#     sku {
#         name           = var.skuapg[0].name
#         tier           = var.skuapg[0].tier
#         capacity       = var.skuapg[0].capacity
#     }

#     gateway_ip_configuration {
#         name         = var.gateway_ip[0].name
#         subnet_id    = var.gateway_ip[0].subnet_id
#     }

#     frontend_ip_configuration {
#         name = var.agw_fe_ip_config[0].name
#         //name         = var.fe_ip_config[0].name
#         public_ip_address_id = azurerm_public_ip.agw_public_ip.id
#     }

#     backend_address_pool {
#         name = var.be_address_pool[0].name
#         //ip_addresses = [var.be_address_pool[0].vms_privateip]
#     }

#     backend_http_settings {
#         name                  = var.be_http_settings[0].name
#         cookie_based_affinity =  var.be_http_settings[0].cookie_based_affinity
#         port                  =  var.be_http_settings[0].port
#         protocol              = var.be_http_settings[0].prtcl
#         request_timeout       =  var.be_http_settings[0].request_timeout
#     }

#     frontend_port {
#         name         = var.fe_port[0].name
#         port         = var.fe_port[0].port
#     }

#     http_listener {
#         name                                  = var.req_rout_rule[0].http_listener_name
#         protocol                              =  var.http_listener[0].prtcl
#         frontend_port_name                    =  var.http_listener[0].frontend_port_name
#         //frontend_ip_configuration_name        = var.http_listener[0].frontend_ip_configuration_name
#         frontend_ip_configuration_name        = var.agw_fe_ip_config[0].name
#         }

#     request_routing_rule {
#         name                       = var.req_rout_rule[0].name
#         priority = var.req_rout_rule[0].priority
#         rule_type                  =  var.req_rout_rule[0].rule_type
#         http_listener_name         = var.req_rout_rule[0].http_listener_name
#         backend_address_pool_name  =  var.req_rout_rule[0].backend_address_pool_name
#         backend_http_settings_name =  var.be_http_settings[0].name
#         //backend_http_settings_name =  var.req_rout_rule[0].backend_http_settings_name
#     }
# }
