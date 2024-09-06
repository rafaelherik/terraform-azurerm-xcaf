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