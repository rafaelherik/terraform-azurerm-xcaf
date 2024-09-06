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
    type = map(object({
        name = string
        address_prefix = string
    }))
    description = "The subnets of the virtual network"
}

variable "role_assignments" {
    type = map(object({
        principal_id = string
        role_definition_id = string
        condition = optional(string)
        condition_version = optional(string)
        delegated_managed_identity_resource_id = optional(string)
        principal_type = optional(string)
        role_definition_id_or_name = optional(string)
        skip_service_principal_aad_check = optional(bool)
    }))
    description = "The role assignments of the virtual network"
    default = {}
}

