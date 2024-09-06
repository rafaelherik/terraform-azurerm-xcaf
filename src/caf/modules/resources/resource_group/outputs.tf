output "resource_group" {
    value = {
        id = azurerm_resource_group.resource_group.id                
        tags = azurerm_resource_group.resource_group.tags
    }
}