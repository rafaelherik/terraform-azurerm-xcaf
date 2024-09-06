# Using data source to get the resource group location
data "azurerm_resource_group" "rg" {
    name = var.resource_group_name
}

# Creating the virtual network
resource "azurerm_virtual_network" "vnet" {    
    name = var.name
    resource_group_name = data.azurerm_resource_group.rg.name
    address_space = var.address_space
    location = default(var.location, data.azurerm_resource_group.rg.location)
    tags = merge(var.tags)
}