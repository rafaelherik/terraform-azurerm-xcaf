variable "name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created"
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix of the AKS cluster"
  type        = string
}

variable "default_node_pool" {
  description = "The of the default node pool"
  type        = map(object({
    name = string
    node_count = number
    vm_size = string
  }))
}   