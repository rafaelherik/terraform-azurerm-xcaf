# Landing Zone Pattern

This pattern is used to create a landing zone in Azure. It creates multiple resources to implement a landing zone following the Cloud Adoption Framework.

## Resource Groups

The resource groups are created in the subscription specified in the `subscription_id` variable. The resource groups are created in the region specified in the `location` variable. The resource groups are created with the tags specified in the `tags` variable.

## Networking

The networking module creates the following resources:

- [Virtual Network](../resources/networking/virtual_network/readme.md)
- Subnet
- [Network Security Group](../resources/networking/network_security_group/readme.md)
- [Route Table](../resources/networking/route_table/readme.md)
- [Public IP Address](../resources/networking/public_ip/readme.md)
- [Network Interface](../resources/networking/network_interface/readme.md)
- [Virtual Machine](../resources/compute/virtual_machine/readme.md)   
- [Application Gateway](../resources/networking/application_gateway/readme.md)
- [Azure Firewall](../resources/networking/azure_firewall/readme.md)
- [Azure Bastion](../resources/networking/azure_bastion/readme.md)

## Compute

The compute module creates the following resources:

- Virtual Machine
- Virtual Machine Scale Set
- AKS Cluster

## Databases

The databases module creates the following resources:

- Azure SQL Database
- Azure Database for PostgreSQL


## Storage

The storage module creates the following resources:

- Azure Storage Account

## Monitoring

The monitoring module creates the following resources:

- Azure Monitor
- Azure Log Analytics Workspace
- Azure Application Insights




## Naming Conventions

The naming conventions are defined in the `naming` variable. The naming conventions are used to name the resources created in the landing zone. The naming conventions are used to ensure consistency across the resources created in the landing zone. The `naming` variable is not mandatory, if the `name` variable is set. If the `name` variable is not set, the `naming` variable is mandatory.

### How to configure the naming conventions?

```hcl
 naming = {
    suffix = string
    delimiter = string
    resource_types = list(string)
    attributes = list(string)
 }
```

## Tagging

The tagging is done in the `tags` variable. The tagging is used to tag the resources created in the landing zone. The tagging is used to ensure consistency across the resources created in the landing zone.



## Validations

### Resource Location

The location of any resource in the landing zone must be one of the locations specified in the `locations` variable. This is done using a terraform data source to validate the location.



