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
   locations = ["eastus", "westus"]
   name = "hub"
   tags = { lz = "hub"}
   resource_groups = [{
        hub = {
            name = "hub"
            location = "eastus"
            tags = { type = "hub" }
        }
   }]
   networking = {
    vnets = [{
        hub_vnet = {
            address_space = "10.0.0.0/16"
            subnets = [{
                default = {
                    name = "hub"
                    address_prefix = "10.0.0.0/24"
                }
                gateway = {
                    name = "gateway"
                    address_prefix = "10.0.1.0/24"
                }
                }]
                
        }
    }]
   }
}