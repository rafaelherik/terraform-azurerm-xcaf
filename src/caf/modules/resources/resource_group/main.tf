resource "azurerm_resource_group" "rg" {
    name = var.name
    location = var.location
    tags = merge(var.tags, each.value.tags)
}

