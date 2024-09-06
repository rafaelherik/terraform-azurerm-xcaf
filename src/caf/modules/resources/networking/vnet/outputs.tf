output "vnet" {
    value = {
        id = azurerm_virtual_network.this.id
        guid = azurerm_virtual_network.this.guid
        dns_servers = azurerm_virtual_network.this.dns_servers
        subnet = azurerm_virtual_network.this.subnet
    }
}
