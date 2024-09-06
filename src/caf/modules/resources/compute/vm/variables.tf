variable "name" {
  description = "The name of the VM"
  type = string
}

variable "image" {
  description = "The image of the VM"
  type = object({
    publisher = string
    offer = string
    sku = string
    version = string
  })
}

variable "computer_name" {
  description = "The computer name of the VM"
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "location" {
  description = "The location of the VM"
  type = string
}

variable "size" {
  description = "The size of the VM"
  type = string

}

variable "admin_username" {
  description = "The admin username of the VM"
  type = string
}

variable "admin_password" {
  description = "The admin password of the VM"
  type = string
  sensitive = true  
}

variable "ssh_keys" {
  description = "The SSH keys of the VM"
  type = list(string)
}

variable "network_interface_ids" {
  description = "The network interface IDs of the VM"
  type = list(string)
}

variable "os_disk_caching" {
  description = "The caching of the OS disk"
  type = string
}

variable "os_disk_create_option" {
  description = "The create option of the OS disk"
  type = string
}      

variable "os_disk_managed_disk_type" {
  description = "The managed disk type of the OS disk"
  type = string
}

variable "image_publisher" {
  description = "The publisher of the image"
  type = string
}   

variable "tags" {
  description = "The tags of the VM"
  type = map(string)
}

variable "disable_password_authentication" {
  description = "The disable password authentication of the VM"
  type = bool
}

variable "landing_zone" {
  description = "The landing zone of the VM"
  type = object({
    tags = map(string)
  })
}

variable "os_profile" {
  description = "The OS profile of the VM"
  type = object({
    admin_username = string
    admin_password_secret = string
    admin_password = string    
  })  
   validation {
    condition = (
      var.os_profile_linux_config.disable_password_authentication == true || 
      (var.os_profile_linux_config.disable_password_authentication == false && 
       (var.os_profile.admin_password != null || var.os_profile.admin_password_secret != null))
    )
    error_message = "When disable_password_authentication is false, either admin_password or admin_password_secret must be provided."
  }
}

variable "os_profile_linux_config" {
  description = "The Linux config of the VM"
  type = object({
    disable_password_authentication = bool
    ssh_keys_secret_names = list(string)
  })
    validation {
    condition     = var.os_profile_linux_config.disable_password_authentication == false || length(var.os_profile_linux_config.ssh_keys_secret_names) > 0
    error_message = "When disable_password_authentication is true, at least one SSH key secret name must be provided."
  }
}

variable "key_vault" {
  description = "The key vault used to retrieve secrets"
  type = object({
    name = string
    resource_group_name = string
  })
}



