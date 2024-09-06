variable "name" {
    type = string
    description = "The name of the resource group"
}

variable "location" {
    type = string
    description = "The location of the resource group"
}

variable "tags" {
    type = map(string)
    description = "The tags of the resource group"
    default = {}
}
  

  variable "role_assignments" {
    type = map(object({
        principal_id = string
        role_definition_id = string
    }))
    description = "The role assignments of the virtual network"
    default = {}
}