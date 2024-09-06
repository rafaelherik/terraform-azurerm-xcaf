variable "name" {
    type = string
    description = "The name of the virtual network"
}

variable "resource_group_name" {
    type = string
    description = "The name of the resource group"
}

variable "address_space" {
    type = list(string)
    description = "The address space of the virtual network"
}

variable "location" {
    type = string
    description = "The location of the virtual network"
}

variable "tags" {
    type = map(string)
    description = "The tags of the virtual network"
}

variable "subnets" {
    type = list(map(object({
        name = string
        address_prefix = string
    })))
    description = "The subnets of the virtual network"
}