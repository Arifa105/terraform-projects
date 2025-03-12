variable "resource_group_name" {
    type = string
  
}
variable "location" {
    type = string
   
}
variable "vm_name" {
    type = string
  
}
variable "nic_id" {
    type = string
  
}
variable "nic_name" {
    type = string
  
}
variable "admin_username" {
    type = string 
}
variable "password" {
    type = string
  
}
variable "storage_account_type" {
    type = string
  
}
//os disk
# variable "os_disk" {
#     type = map(object({
#       caching = string  //required
#       storage_account_type = string //required
#       disk_encryption_set_id = string
#       disk_size_gb = string
#       name = string
#       secure_vm_disk_encryption_set_id = string
#       security_encryption_type = string
#       write_accelerator_enabled  = string
# }))
# }
variable "size" {
    type = string
    }
variable "publisher" {
    type = string
    }
variable "vm_sku" {
    type = string
}
variable "versionl" {
    type = string
  
}
variable "vm_offer" {
    type = string
    }

variable "caching" {
    type = string
  
}

//mytimeouts block - optional
# variable "timeouts" {
#   type = map(object({
#     create = string
#     read   = optional(string, null)
#     update = optional(string, null)
#     delete = optional(string, null)
#   }))
# }
# //secret block - optional
# variable "secret" {
#   type = map(object({
#     certificate = string
#     key_vault_id = string
#   }))
# }

# variable "certificate" {
#   type = map(object({
#     url = string
#    store= string
#   }))
# }

# //os_image block - optional
# variable "os_image_notification" {
#   type = map(object({
#     timeout = string
#   }))
# }
# //termination_notification bloack -optional
# variable "termination_notification" {
#   type = map(object({
#     enabled= string
#     timeout = string
#   }))
# }
# //winrm bloack -optional
# variable "winrm_listener" {
#   type = map(object({
#     protocol = string
#       certtificate_url = string
#   }))
# }
# //boot_diagnostics bloack -optional
# variable "boot_diagnostics" {
#     type = map(object({
#       storage_account_uri = string

#     }))
# }
# //diff_disk_seeting --optional
# variable " diff_disk_settings" {
#     type = map(object({
#       option = string //required
#       placement = string
#     }))
# }

# variable "gallery_application" {
#     type = map(object({
#       version_id = string //required
#       automatic_up_enabled = string
#       configuration_blob_uri = string
#       order =  string
#       tag = string
#       treat_failure = bool
#     }))
# }


# variable "identity" {
#     type = map(object({
#     type =string
#    identity_ids  = number
#     }))
  
# }

# variable "additional_capabilities" {
#     type = map(object({
#       ultra_ssd_enabled = string
#       hibernation_enabled = bool

#     }))
  
# }
# variable "additional_unattend_content" {
#     type = map(object({
#       content = string
#       setting = string
#     }))
  
# }

# # variable "licence_type " {
# #     type = string
  
# # }
# variable "max_bid_price" {
#     type = number
  
# }

# variable "patch_assessment_mode" {
#     type = string
  
# }
# variable "patch-mode" {
#     type = string
  
# }


