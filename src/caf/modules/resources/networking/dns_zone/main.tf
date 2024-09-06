resource "azurerm_dns_zone" "dns_zone" {
    name = var.name
    resource_group_name = var.resource_group_name
    tags = var.tags
}

resource "azurerm_dns_cname_record" "cname_record" {
    for_each = var.cname_records
    name = each.value.name
    zone_name = azurerm_dns_zone.dns_zone.name
    resource_group_name = azurerm_dns_zone.dns_zone.resource_group_name
    ttl = each.value.ttl
    record = each.value.record
}
