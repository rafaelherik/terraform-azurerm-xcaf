# Azure Cloud Adoption Framework modules for OpenTofu and Terraform

This repository contains modules for the Azure Cloud Adoption Framework (CAF) that are compatible with OpenTofu and Terraform.

## Modules


### Landing Zones

The `landing_zones` module is used to create landing zones in Azure. It creates a set of default configurations and attributes for the landing zones, and can be used as a base for more complex configurations.

On each landing zone, you can then create resources such as virtual networks, subnets, and other networking components.

#### Default Landing Zone Types

##### Hub Landing Zone

The `hub_landing_zone` type is used to create a hub landing zone. It creates a virtual network with a default subnet, and a route table that allows all traffic to the virtual network. 


##### Security Landing Zone

The `security_landing_zone` type is used to create a security landing zone. It creates a KeyVault, a Log Analytics Workspace, and a Network Watcher.






#### Networking

The `networking` module is used to create virtual networks in Azure.