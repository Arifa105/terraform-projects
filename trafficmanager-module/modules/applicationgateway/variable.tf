variable "aplication_gateway_name" {
    type = string
  
}
variable "resource_group_name" {
    type = string
  
}

variable "location" {
    type = string
  
}
variable "sku_name" {
    type = string
  
}
variable "aplication_gateway_tier" {
    type = string
  
}

variable "agw_pip_name" {
    type = string
  
}

variable "subnet_id" {
    type = string
  
}

variable "agw_frontend_pip_name" {
    type = string
  
}

variable "agw_backendadresspool_name" {
    type = string
  
}

variable "backend_http_settings_name" {
    type = string
   
}

variable "backend_http_settings_port" {
    type =  number
   
}
variable "backend_http_settings_protocol" {
    type = string
   
}

variable "cookie_based_affinity" {
    type = string
  
}

variable "frontend_port_name" {
    type = string
  
}

variable "frontend_port" {
    type = number
  
}

variable "http_listener_name" {
    type = string
  
}

variable "http_listener_protocol" {
    type = string
  
}
variable "routing_rule_name" {
    type = string
  
}
variable "agw_public_ip_name" {
    type = string
  
}


variable "routing_rule_type" {
    type = string
  
}
variable "vms_privateip" {
    type = set(string)
  
}

# variable "dns_zone_name" {
#     type = string
  
# }



variable "agw_rule_priority" {
    type = number
  
}
