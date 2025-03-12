# Define the Public IP resource
resource "azurerm_public_ip" "agw_public_ip" {
  name                = var.agw_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"  # Can be "Dynamic" or "Static"
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
        ip_addresses = var.vms_privateip

    
      
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