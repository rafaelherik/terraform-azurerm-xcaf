
output "landing_zone_name" {
    value = var.name
}

output "available_locations" {
    value = var.locations
}

output "resource_groups" {
    value = [for rg in var.resource_groups : {
        id = rg.name
        name = rg.name
    }]
}

output "virtual_networks" {
    value = [for vnet in var.networking.vnets : {
        id = vnet.name
        name = vnet.name
        subnets = [for subnet in vnet.subnets : {
            id = subnet.name
            name = subnet.name
        }]
    }]
}
