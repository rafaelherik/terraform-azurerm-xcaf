variable "name" {
    description = "The name of the DNS zone"
    type = string
}

variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
}

variable "tags" {
    description = "The tags of the DNS zone"
    type = map(string)
}

variable "cname_records" {
    description = "The CNAME records of the DNS zone"
    type = map(object({
        name = string
        ttl = number
        record = string
    }))
}

variable "role_assignments" {
    description = "The role assignments of the DNS zone"
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
}
