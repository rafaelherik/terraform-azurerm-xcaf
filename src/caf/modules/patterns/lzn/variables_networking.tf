
variable "networking" {
    type = object({
        vnets = optional(map(object({            
            id = optional(string)
            name = string
            address_space = list(string)
            resource_group_name = string
            location = optional(string)
            subnets = optional(map(object({
                name = string
                address_prefix = string
            })))
            tags = map(string)
        })), {})        
        private_dns_zones = optional(map(object({
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
        })), {})
    })
    description = "The Networing resources of the landing zone. The networking resources will be created in the resource group specified in the resource groups variable."
    default = {
        vnets = {}    
        private_dns_zones = {}
    }

  
}


locals {
    # Validate if the vnets are in one of the locations specified in the locations variable
  valid_vnet_locations = alltrue([
    for vnet in var.networking.vnets : contains(var.locations, vnet.location)
  ])
}