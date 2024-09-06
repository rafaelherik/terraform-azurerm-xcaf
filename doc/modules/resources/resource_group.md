# Resource Group

## Description

The `resource_group` module creates a resource group in Azure.

## Terraform Module

This module is a wrapper for the `azurerm_resource_group` resource.

It allows for the creation of a resource group with optional role assignments.


### Example
```hcl
module "resource_group" {
    source = "git::https://github.com/Azure/caf-terraform-modules.git//modules/resources/resource_group"
    resource_group_name = "example"
    location = "West Europe"
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
``` 

### Outputs

```hcl
output "resource_group_id" {
    value = module.resource_group.resource_group_id
}
``` 