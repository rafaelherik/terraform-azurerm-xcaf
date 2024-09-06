# VNet

## Description

The `vnet` module creates a virtual network in Azure.

## Terraform Module

This module is a wrapper for the `azurerm_virtual_network` resource. It allows for the creation of a virtual network with optional role assignments.

### Example
```hcl
module "vnet" {
    source = "git::https://github.com/Azure/caf-terraform-modules.git//modules/resources/vnet"
    resource_group_name = "example"
    location = "West Europe"
    subnets = {
        default = {
            name = "default"
            address_prefixes = ["10.0.0.0/16"]
        }
    }
    tags = {
        environment = "dev"
    }
    role_assignments = {
        "role_definition_id_or_name" = {
            "principal_id" = "principal_id"
            "role_definition_id" = "role_definition_id"
        }
    }
}


