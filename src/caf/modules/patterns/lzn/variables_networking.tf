
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
            virtual_network_links = optional(map(object({
                name = string
                subnet_id = string
                resource_group_name = string
            })),{})
            a_records = optional(map(object({
                name = string
                ttl = number
                records = list(string)
            })),{})
            txt_records = optional(map(object({
                name = string
                ttl = number
                records = list(string)
            })),{})
            cname_records = optional(map(object({
                name = string
                ttl = number
                records = list(string)
            })),{})
            mx_records = optional(map(object({
                name = string
                ttl = number
                records = object({
                    priority = number
                    weight = number
                    port = number
                    target = string
                    exchange = string
                    preference = number
                    mail_exchange = string

                })
            })),{})
            srv_records = optional(map(object({
                name = string
                ttl = number
                records = object({
                    priority = number
                    weight = number
                    port = number
                    target = string
                })
            })),{})
            ptr_records = optional(map(object({
                name = string
                ttl = number
                records = list(string)                
            })),{})
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