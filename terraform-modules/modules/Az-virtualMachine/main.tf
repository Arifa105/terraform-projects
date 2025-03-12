# Windows Virtual Machine
resource "azurerm_windows_virtual_machine" "win-vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.password
  network_interface_ids = [var.nic_id]

os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
      # disk_encryption_set_id =var.os_disk.disk_encryption_set_id
      # disk_size_gb = var.os_disk.disk_size_gb
      # name = var.os_disk.name
      # secure_vm_disk_encryption_set_id = var.os_disk.secure_vm_disk_encryption_set_id
      # security_encryption_type = var.os_disk.security_encryption_type
      # write_accelerator_enabled  = var.os_disk.write_accelerator_enabled
      # // optional
      # diff_disk_settings {
      #   placement = var.diff_disk_settings.placement
      #  option = var.diff_disk_settings.option
      # }
   
}

source_image_reference {
    publisher = var.publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version = var.versionl
  }

  depends_on = [var.nic_name, var.resource_group_name ]

#   //optional 
#   timeouts {
#     create = var.timeouts.create
#     read = var.timeouts.read
#     update = var.timeouts.update
#     delete = var.timeouts.delete

#   }
#   //optional -secret
#   secret{
#     certificate {
#      store = var.certicate.store 
#      url = var.certicate.url
#     }
#     key_vault_id = var.secret.key_vault_id
#     }

#     #  os_image_notification{
#     #   timeout = var.os_image_notification.timeout
#     # }
#     //optional
#     termination_notification {
#       enabled = var.termination_notification.enabled
#       timeout = var.termination_notification.timeout
#     }
#      //optional
#      winrm_listener{
#     protocol = var.winrm.protocol
#     certificate_url  = var.winrm.certtificate_url
#   }
#    //optional
#   boot_diagnostics{
#     storage_account_uri = var.boot_diagnostics.storage_account_uri
#   }
#   //optional
#   gallery_application{
#     version_id = var.gallery_application.version_id
#     //automatic_upgrade_enabled = var.gallery_application.automatic_up_enabled
#       configuration_blob_uri = var.gallery_application.configuration_blob_uri
#       order = var.gallery_application.order
#       tag = var.gallery_application.tag
#     //treat_failure_as_deployment_failure_enabled = var.gallery_application.treat_failure

#   }
#   identity {
#     type = var.identity.type
#     identity_ids = var.identity.identity_ids
#   }

# additional_capabilities{
#   ultra_ssd_enabled = var.additional_capabilities.ultra_ssd_enabled
#  // hibernation_enabled = var.additional_capabilities.hibernation_enabled
# }
#   additional_unattend_content{
#     content = var.additional_capabilities.content
#     setting = var.additional_capabilities.setting
#   }
#   max_bid_price = var.max_bid_price
#   patch_assessment_mode = var.patch_assessment_mode
#   patch_mode = var.patch-mode
#   //license_type = var.licence_type 
#   }

}
