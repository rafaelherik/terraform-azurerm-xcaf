variable "compute" {
    type = map(object({
        vms = optional(list(map(object({
            name = string
            resource_group_name = string
            location = string
            tags = map(string)
        }))), [])
        aks = optional(list(map(object({
            name = string
            resource_group_name = string
            location = string
            tags = map(string)
        }))), [])
    }))
    default = {}
}
