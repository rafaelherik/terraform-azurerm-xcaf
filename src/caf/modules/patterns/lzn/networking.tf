# Configuring the virtual networks

module "virutal_networks" {
    source = "../../resources/networking/vnet"
    for_each = toset(var.networking.vnets)
    name = each.value.name
    address_space = each.value.address_space
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    tags = each.value.tags
    subnets = each.value.subnets
}

# Configuring the DNS zones
module "dns_zones" {
    source = "../../resources/networking/dns_zone"
    for_each = toset(var.networking.dns_zones)
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    tags = each.value.tags
    cname_records = each.value.cname_records
}

# Configuring the private DNS zones
module "private_dns_zones" {
    source = "../../resources/networking/private_dns_zone"
    for_each = toset(var.networking.private_dns_zones)
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    tags = each.value.tags
    mx_records = each.value.mx_records
    a_records = each.value.a_records
    cname_records = each.value.cname_records
    srv_records = each.value.srv_records
    txt_records = each.value.txt_records
    ptr_records = each.value.ptr_records
    virtual_network_links = each.value.virtual_network_links
}


output "vnets" {
    value = [for vnet in azurerm_virtual_network.vnet : {
        id = vnet.id
        name = vnet.name
    }]
    description = "The virtual networks"
}