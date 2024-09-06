terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }
}

provider "azurerm" {
    features {}
}


module "hub-lz" {   
   source = "./modules/patterns/lzn"   
   locations = ["westeurope", "northeurope"]
   name = "hub"
   tags = { lz = "hub"}
   resource_groups = {
        hub = {
            name = "hub-rg"
            location = "westeurope"
            tags = { type = "hub" }
        }
   }
   networking = {
    vnets = {
        hub_vnet = {
            name = "hub-vnet"
            location = "westeurope"
            tags = { type = "hub" }
            resource_group_name = "hub-rg"
            address_space = ["10.0.0.0/16"]
            subnets = {
                default = {
                    name = "hub"
                    address_prefix = "10.0.0.0/24"
                }
                gateway = {
                    name = "gateway"
                    address_prefix = "10.0.1.0/24"
                }
            }
        }
    }
   }
}