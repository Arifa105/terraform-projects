module "resourcegroup" {
  source = "./modules/Az-resourceGroup"
  resource_group_name = local.resource_group_name
  location = local.location
}

module "virtualnetwork" {
  source = "./modules/Az-virtualNetwork"
  virtual_network_name= local.virtual_network[0].name
  location = module.resourcegroup.rg_location_output
  resource_group_name= module.resourcegroup.rg_name_output
  address_space = local.virtual_network[0].address_space
  subnet_name = local.subnet[0].name
  subnet_address_prefix = local.subnet[0].address_prefixes
  }

  module "interfacecard" {
      source = "./modules/Az-interfaceCard"
      resource_group_name = module.resourcegroup.rg_name_output
      location =module.resourcegroup.rg_location_output
      nic_name = local.nic.nic_name
      ip_name =local.nic.ip_config_name
      pip_allocation_method = local.nic.pipdetails_allocation
      subnet_id = module.virtualnetwork.subnetid_output
      pip_id = module.virtualnetwork.subnetid_output
    }

  module "nsg"{
    source = "./modules/Az-nsg"
    resource_group_name = module.resourcegroup.rg_name_output
    location = module.resourcegroup.rg_location_output
    subnet_id = module.virtualnetwork.subnetid_output
    nsg_name = local.nsg-details.nsg_name
    sr-name = local.nsg-details.sr-name
    sr_priority = local.nsg-details.sr_priority
    sr_direction = local.nsg-details.sr_direction
    sr_access = local.nsg-details.sr_access
    sr_protocol = local.nsg-details.sr_protocol
    sr_source_port_range = local.nsg-details.sr_source_port_range
    sr_destination_port_range = local.nsg-details.sr_destination_port_range
    sr_source_address_prefix = local.nsg-details.sr_source_address_prefix
    sr_destination_address_prefix =  local.nsg-details.sr_source_address_prefix
    }
  
  module "pip" {
      source = "./modules/Az-publicIp"
      pip_name  = var.pip_name
      resource_group_name =  module.resourcegroup.rg_name_output
      location            = module.resourcegroup.rg_location_output
      pipdetails_allocation =  local.nic.pipdetails_allocation
  }

  module "winvm" {
    source = "./modules/Az-virtualMachine"
   resource_group_name = module.resourcegroup.rg_name_output
    location = module.resourcegroup.rg_location_output
    vm_name = local.virtual_machine.vm-name
    nic_id = module.interfacecard.nic_id_output
    nic_name = module.interfacecard.nic_name_output
    size = local.virtual_machine.vm_size
    admin_username = local.virtual_machine.admin_username
    password = local.virtual_machine.password
    caching = local.virtual_machine.caching
    storage_account_type = local.virtual_machine.storage_account_type
    publisher = local.virtual_machine.vm_publisher
    vm_offer = local.virtual_machine.vm_offer
    vm_sku = local.virtual_machine.vm_sku
    versionl = local.virtual_machine.versionl


  }


