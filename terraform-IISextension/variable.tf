
variable "resourcedetails" {
  type = map(object({
    name             = string
    location         = string
    size             = string
    rg_name          = string
    vnet_name        = string
    subnet_name      = string
    address_space    = list(string)
    address_prefixes = list(string)
  }))
  default = {
    northcetralus = {
      rg_name          = "northcentralus-rg"
      name             = "north-vm"
      location         = "northcentralus"
      size             = "Standard_B2s"
      vnet_name        = "north-vnet"
      subnet_name      = "north-subnet"
      address_space    = ["10.0.0.0/16"]
      address_prefixes = ["10.0.0.0/24"]
    }
    westus = {
      rg_name          = "west-rg"
      name             = "west-vm"
      location         = "westus"
      size             = "Standard_B1s"
      vnet_name        = "west-vnet"
      subnet_name      = "west-subnet"
      address_space    = ["10.1.0.0/16"]
      address_prefixes = ["10.1.0.0/24"]
    }
  }
}







