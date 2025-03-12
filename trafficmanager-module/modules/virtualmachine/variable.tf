variable "virtualmachine_name" {
    description = "The name of the virtual machine"
    type = string
}

variable "count_value" {
    description = "count length"
    type = number
   
}

variable "admin_username" {
    description = "The username of the admin"
    type = string
  
}

variable "admin_password" {
    description = "The admin password"
    type = string
  
}

variable "computer_name" {
    description = "The name of the computer"
    type = string
  
}
variable "environment_name" {
  description = "Enter the name of the environment"
  type = string
}


variable "resource_group_name" {
    description = "The name of the resourse group"
    type = string
  
}

variable "location" {
    description = "The location of the resourse group"
    type = string
  
}

variable "subnet_id" {
    type = string
  
}