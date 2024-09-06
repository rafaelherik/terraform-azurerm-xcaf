variable "name" {
    type = string
    description = "The name of the landing zone"
}

variable "tags" {
    type = map(string)
    description = "The tags of the landing zone. These tags will be applied to all resources in the landing zone"
}

variable "resource_groups" {
    type = map(object({
        name = string
        location = string
        tags = map(string)
    })) 
    description = "The resource groups of the landing zone. Each resource group will be created in the default location of the landing zone if not specified."    
}


variable "locations" {
    type = list(string)
    description = "The locations of the landing zone. It is used to validate if the resources are in one of the locations specified in the locations variable."    
}


locals {
  # Validate if the resource groups are in one of the locations specified in the locations variable
  valid_rg_locations = alltrue([
    for rg in var.resource_groups : contains(var.locations, rg.location)
  ]) 
}