
# CONFIGURING THE PRIVATE DNS ZONE

resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}


# CONFIGURING THE PRIVATE DNS ZONE VIRTUAL NETWORK LINKS
data "azurerm_virtual_network" "virtual_network" {
  for_each = var.virtual_network_links
  name                = each.value.vnet_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
  for_each = var.virtual_network_links
  name                  = each.value.name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = data.azurerm_virtual_network.virtual_network[each.key].id
}

# CONFIGURING THE PRIVATE DNS ZONE RECORD SETS
resource "azurerm_private_dns_a_record" "private_dns_a_record" {
    for_each = var.a_records
    name = each.value.name
    zone_name = azurerm_private_dns_zone.private_dns_zone.name
    resource_group_name = var.resource_group_name
    ttl = each.value.ttl
    records = each.value.records
}

resource "azurerm_private_dns_cname_record" "private_dns_cname_record" {
    for_each = var.cname_records
    name = each.value.name
    zone_name = azurerm_private_dns_zone.private_dns_zone.name
    resource_group_name = var.resource_group_name
    ttl = each.value.ttl
    record = each.value.record
}

resource "azurerm_private_dns_mx_record" "private_dns_mx_record" {
    for_each = var.mx_records 
    name = each.value.name
    zone_name = azurerm_private_dns_zone.private_dns_zone.name
    resource_group_name = var.resource_group_name
    ttl = each.value.ttl
    record {
        preference = each.value.preference
        exchange = each.value.exchange
    }
}

resource "azurerm_private_dns_ptr_record" "private_dns_ptr_record" {
    for_each = var.ptr_records
    name = each.value.name
    zone_name = azurerm_private_dns_zone.private_dns_zone.name
    resource_group_name = var.resource_group_name
    ttl = each.value.ttl
    records = each.value.records
}

resource "azurerm_private_dns_srv_record" "private_dns_srv_record" {
    for_each = var.srv_records     
    name = each.value.name
    zone_name = azurerm_private_dns_zone.private_dns_zone.name
    resource_group_name = var.resource_group_name
    ttl = each.value.ttl
    record {
        priority = each.value.priority
        weight = each.value.weight
        port = each.value.port
        target = each.value.target
    } 
}

resource "azurerm_private_dns_txt_record" "private_dns_txt_record" {
    for_each = var.txt_records
    name = each.value.name
    zone_name = azurerm_private_dns_zone.private_dns_zone.name
    resource_group_name = var.resource_group_name
    ttl = each.value.ttl
    record {
        value = each.value.value
    }
}