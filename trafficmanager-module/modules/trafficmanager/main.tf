resource "azurerm_traffic_manager_profile" "tm" {
    name = var.traffic_manager_name
    resource_group_name = var.resource_group_name
    traffic_routing_method = var.traffic_routing_method
    monitor_config {
        port = var.port_value
        protocol = var.protocol
        path = "/"
    }
    dns_config {
        relative_name = var.dns_name
        ttl = var.ttl
      
    }
}


