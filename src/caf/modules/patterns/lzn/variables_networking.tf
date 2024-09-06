
variable "networking" {
    type = list(map(object({
        vnets = list(map(object({            
            id = optional(string)
            name = string
            address_space = string  
            resource_group_name = string
            location = optional(string)
            tags = map(string)
        })))
        subnets = list(map(object({            
            id = optional(string)
            name = string
            address_prefixes = list(string)            
            tags = map(string)
            virtual_network_name = string  
            virtual_network_id = string          
        })))
        private_dns_zones = list(map(object({
            name = string
            resource_group_name = string
            location = string
            tags = map(string)
            a_records = list(map(object({
                name = string
                ttl = number
                records = list(string)
            })))
            txt_records = list(map(object({
                name = string
                ttl = number
                records = list(string)
            })))
            cname_records = list(map(object({
                name = string
                ttl = number
                records = list(string)
            })))
            mx_records = list(map(object({
                name = string
                ttl = number
                records = list(string)
            })))
            srv_records = list(map(object({
                name = string
                ttl = number
                records = list(string)
            })))
            ptr_records = list(map(object({
                name = string
                ttl = number
                records = list(string)
            })))
        })))
    })))
    description = "The Networing resources of the landing zone. The networking resources will be created in the resource group specified in the resource groups variable."

  validation {
    condition = alltrue([
      for network in var.networking : alltrue([
        for subnet in network.subnets : 
          (subnet.virtual_network_name != null) != (subnet.virtual_network_id != null)
      ])
    ])
    error_message = "Either virtual_network_name or virtual_network_id must be provided for each subnet, but not both."
  }
}


locals {
    # Validate if the vnets are in one of the locations specified in the locations variable
  valid_vnet_locations = alltrue([
    for vnet in var.networking.vnets : contains(var.locations, vnet.location)
  ])
}