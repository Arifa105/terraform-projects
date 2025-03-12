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
# variable "vms_privateip" {
#     type = set(string)
  
# }

# variable "dns_zone_name" {
#     type = string
  
# }
variable "agw_rule_priority" {
    type = number
  
}

# variable "pipagw_name" {
#     type = string
# }
# variable "resource_group_name" {
#     type = string
  
# }
# variable "location" {
#     type = string
# }
# variable "virtual_network_name" {
#      type = string
# }
# variable "pip_details_allocation" {
#     type = string
  
# }
# //application Gateway varaibles decleartion
# variable "apg_name" {
#     type = string
  
# }
# variable "skuapg" {
#     type = list(object({
#         name           = string
#         tier           = string
#         capacity  = number
#     }))
  
# }
# variable "gateway_ip" {
#     type = list(object({
#       name = string
#       subnet_id =string 
#     }))
  
# }
# variable "fe_port" {
#     type = list(object({
#       name = string
#       port = number
#     }))
  
# }

# variable "agw_fe_ip_config" {
#     type = list(object({
#     name = string
#     }))
  
# }
# variable "be_address_pool" {
#     type = list(object({
#       name = string
#    //vms_privateip = set(string)
#   }))
  
# }

# variable "be_http_settings" {
#     type = list(object({
#       name = string
#       cookie_based_affinity = string
#       port = number
#       prtcl = string
#       request_timeout = number
#     }))
  
# }
# variable "http_listener" {
#     type = list(object({
#       //name = string
#       //frontend_ip_configuration_name = string
#       frontend_port_name = string
#       prtcl = string

#     }))
# }

# # variable "req_rout_rule" {
# #   type = list(object({
# #     name                        = string
# #     priority                    = number
# #     rule_type                   = string
# #     http_listener_name          = object({
# #       name = string
# #     })
# #     backend_address_pool_name   = string
# #     backend_http_settings_name  = string
# #   }))
# # }
# variable "req_rout_rule" {
#     type = list(object({
#       name = string
#       priority = number
#       rule_type = string
#       http_listener_name = string
#       backend_address_pool_name = string
#       //backend_http_settings_name = string

#     }))
# }



