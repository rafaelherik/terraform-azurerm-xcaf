output "resource_group" {
    value = {
        id = azurerm_resource_group.resource_group.id
        name = azurerm_resource_group.resource_group.name
        location = azurerm_resource_group.resource_group.location
        tags = azurerm_resource_group.resource_group.tags
    }
}