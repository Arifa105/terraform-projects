locals{
  resource_group_name = "101"
  location = "northcentralus"
//map of values for vnet
virtual_network =[
  {
  name = "vnet-101"
  address_space = ["10.0.0.0/16"]
}
] 
//map of values for subnet
subnet = [
  {
    name = "subnet-101"
    address_prefixes = ["10.0.1.0/24"]
  }
]

nic = {
    nic_name = "nic-101"
    pip_name ="pip-101"
    ip_config_name ="internal"
    ip_config_pip = "Dynamic"
    pipdetails_allocation ="Static"
}


virtual_machine = {
    vm-name = "vm-101"
    admin_username = "adminuser"
    password = "Test123456789"
    storage_account_type = "Standard_LRS"
    vm_size = "Standard_DS2_v2"
    vm_publisher = "MicrosoftWindowsServer"
    vm_sku ="2016-Datacenter"
    versionl ="latest"
    vm_offer = "WindowsServer"
    caching = "ReadWrite"
}
nsg-details = {
    
 nsg_name= "nsg-101"

sr-name = "allow-RDP"

sr_priority  = 100

sr_direction = "Inbound"

sr_access = "Allow"

sr_protocol = "Tcp"

sr_source_port_range = "*"

sr_destination_port_range = "3389"

sr_source_address_prefix =  "*"
   
sr_destination_address_prefix = "*"
    }
}

    //optional attributes
#   mytimeouts = [
#     {
#     create = null
#     read   = null
#     update = null
#     delete = null

#   }]
#   secret = {
#     example1 = {
#       certificate  = null
#       key_vault_id = null
#     },
#     example2 = {
#       certificate  = null
#       key_vault_id = null
#     }
#   }

#   os_image_notification = {
#     image1 = {
#       timeout = null
#     }
#   }

#   termination_notification = {
#     notification1 = {
#       enabled = null
#       timeout =  null
#     }
#   }

#   winrm_listener = {
#     listener1 = {
#       protocol         = null
#       certtificate_url = null
#     }
#   }

#   boot_diagnostics = {
#     diag1 = {
#       storage_account_uri = null
#     }
#   }

#   certificate = {
#     cert1 = {
#       store = null
#       url   = null
#     }
#   }

#   diff_disk_settings = {
#     disk1 = {
#       option   = null
#       placement = null
#     }
#   }

#   gallery_application = {
#     app1 = {
#       version_id                              = null
#       automatic_upgrade_enabled              =  null
#       configuration_blob_uri                 =  null
#       order                                   = null
#       tag                                     = null
#       treat_failure_as_deployment_failure_enabled = null
#     }
#   }

#   identity = {
#     id1 = {
#       principal_id = null
#       tenant_id    = null
#     }
#   }

#   additional_capabilities = {
#     capability1 = {
#       ultra_ssd_enabled      = null
#       UltraSSD_LRS           = null
#       hibernation_enabled    =  null
#     }
#   }

#   additional_unattend_content = {
#     content1 = {
#       content =  null
#       setting = null
#     }

#   }
#   os_disk = {
#     os_disk1 = {
#       caching = "ReadWrite" //required
#       storage_account_type = "Standard_LRS"//required
#       diff_disk_settings = null
#       disk_encryption_set_id = null
#       disk_size_gb = null
#       name = null
#       secure_vm_disk_encryption_set_id = null
#       security_encryption_type = null
#       write_accelerator_enabled  = null
#     }
#   }
#   //optional 

#   timeouts = {
#     create =  null
#     read   = null    # This is optional, and you can explicitly set it to null
#     update = null
#     delete = null    # Similarly, `delete` can be null
#   }
# secret1 = {
#     certificate = null
#     key_vault_id = null   # `key_vault_id` is optional, so can be null
#   }

#   certificate1 = {
#     url   = null
#     store = null
#   }

#   os_image_notification1 = {
#     timeout = null
#   }

#   termination_notification1 = {
#     enabled = null
#     timeout = null
#   }

#   winrm_listener1 = {
#     protocol =  null
#     certificate_url = null  # Optional, so it can be null
#   }

#   boot_diagnostics1 = {
#     storage_account_uri = null
#   }

#   diff_disk_settings1 = {
#     option = "Local"
#     placement = null
#   }

#   gallery_application1 = {
#     version_id = "1.0"
#     automatic_up_enabled = null
#     configuration_blob_uri = null
#     order = null
#     tag =  null
#     treat_failure = null
#   }

#   identity1 = {
#     type = "SystemAssigned"
#     identity_ids = null  # Optional, can be null
#   }

#   additional_capabilities1 = {
#     ultra_ssd_enabled = null
#     hibernation_enabled = null
#   }

#   additional_unattend_content1 = {
#     content = null
#     setting = null
#   }

#   //licence_type = "Windows_Server"

#   max_bid_price = 0

#   patch_assessment_mode = null

#   patch_mode = null
# }






