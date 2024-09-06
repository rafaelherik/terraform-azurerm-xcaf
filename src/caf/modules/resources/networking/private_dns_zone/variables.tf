variable "name" {
  description = "The name of the private DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "location" {
  description = "The location of the private DNS zone"
  type        = string
}

variable "tags" {
  description = "The tags of the private DNS zone"
  type        = map(string)
}


variable "virtual_network_links" {
  description = "The virtual network links of the private DNS zone"
  type        = map(object({
    name = string
    resource_group_name = string
  }))
  default = {}
}

variable "a_records" {
  description = "The A records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = list(string)
  }))
  default = {}
}

variable "cname_records" {
  description = "The CNAME records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = list(string)
  }))
  default = {}
}

variable "mx_records" {
  description = "The MX records of the private DNS zone"
  type        = map(object({
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
  }))
  default = {}
}

variable "ptr_records" {
  description = "The PTR records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = list(string)
  }))
}

variable "srv_records" {
  description = "The SRV records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = object({
      priority = number
      weight = number
      port = number
      target = string
    })
  }))
  default = {}
}

variable "txt_records" {
  description = "The TXT records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number  
    records = list(string)
  }))
  default = {}
}

variable "role_assignments" {
  description = "The role assignments of the private DNS zone"
  type        = map(object({
    principal_id = string
    role_definition_id_or_name = string
    condition = string
    condition_version = string
    delegated_managed_identity_resource_id = string
    principal_type = string
    skip_service_principal_aad_check = bool
  }))
  default = {}
}