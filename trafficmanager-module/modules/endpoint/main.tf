resource "azurerm_traffic_manager_external_endpoint" "endpoint1" {

    name = var.endpoint_name
    target = var.target_id
    profile_id = var.profile_id
    priority = var.priority
  
}