locals {
    resource_group_name = "rg-northcentralus-01"
    location = "North Central US"
    virtual_network_name = "vnet-northventralus-01"
    vnet_address_space = ["10.0.0.0/16"]
    subnet_name = ["ApplicationGatewaySubnet", "vms-subnet"]
    vnet_cidr = "10.0.0.0/16"

    //vnet 2 values
    virtual_network_name2 = "vnet-westus-02"
    location2 = "West US"
    vnet_address_space2 = ["10.1.0.0/16"]
    vnet_cidr2 = "10.1.0.0/16"
    subnet_name1 = ["ApplicationGatewaySubnet", "vms-subnet"]

    //virtualmachine values
    virtualmachine_name = "vm"
    virtualmachine_name_2 = "vm2"
    environment_name = "dev"
    admin_username = "azure.user"
    admin_password = "alinaVirtualM43"
    computer_name = "myPC-0"
    count_value = 2

    //AGW values
    # dns_zone_name = "gateway1.com"
    # dns_zone_name2 = "gateway2.com"
    agw_public_ip_name ="my-app-gateway-public-ip"
    agw_public_ip_name2 = "my-app-gateway2-public-ip"
    aplication_gateway_name  = "my-app-gateway"
    aplication_gateway_name2  = "my-app-gateway_2"
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
    agw_rule_priority_2 = 2

    //Traffic Manager Values
    traffic_manager_name ="tf-test-01"
    traffic_routing_method = "Priority"
    port_value = 80
    protocol = "HTTP"
    dns_name = "myappdns"
    ttl = 60

    //endpoint
    endpoint_name = "agw01-endpoint"
    priority = 1
    endpoint_name2= "agw02-endpoint"
    priority2 = 2


    
  

     
    }
    
  
