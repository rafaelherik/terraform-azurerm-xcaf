variable "name" {
  description = "The name of the private DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
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
}

variable "a_records" {
  description = "The A records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = list(string)
  }))
}

variable "cname_records" {
  description = "The CNAME records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = list(string)
  }))
}

variable "mx_records" {
  description = "The MX records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number
    records = list(object({
      preference = number
      exchange = string
    }))
  }))
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
    records = list(object({
      priority = number
      weight = number
      port = number
      target = string
    }))
  }))
}

variable "txt_records" {
  description = "The TXT records of the private DNS zone"
  type        = map(object({
    name = string
    ttl = number  
    records = list(string)
  }))
}

