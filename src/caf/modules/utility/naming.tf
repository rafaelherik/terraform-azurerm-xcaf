variable "resource_type" {
  type        = string
  description = "The type of Azure resource (e.g., 'vm', 'nic', 'nsg')"
}

variable "environment" {
  type        = string
  description = "The environment (e.g., 'dev', 'prod', 'staging')"
}

variable "project" {
  type        = string
  description = "The project name or acronym"
}

variable "location" {
  type        = string
  description = "The Azure region short name (e.g., 'eastus', 'westeu')"
}

variable "instance" {
  type        = string
  default     = "001"
  description = "The instance number, default is '001'"
}

locals {
  # Define prefixes for different resource types
  resource_prefixes = {
    vm   = "vm"
    nic  = "nic"
    nsg  = "nsg"
    vnet = "vnet"
    snet = "snet"
    pip  = "pip"
    kv   = "kv"
    st   = "st"
    # Add more resource types as needed
  }

  # Get the prefix for the given resource type
  prefix = lookup(local.resource_prefixes, var.resource_type, var.resource_type)

  # Create the name using the defined convention
  name = lower(join("-", [
    local.prefix,
    var.project,
    var.environment,
    var.location,
    var.instance
  ]))
}

output "name" {
  value       = local.name
  description = "The generated name for the Azure resource"
}

# outputs.tf

output "resource_name" {
  value       = local.name
  description = "The generated name for the Azure resource"
}