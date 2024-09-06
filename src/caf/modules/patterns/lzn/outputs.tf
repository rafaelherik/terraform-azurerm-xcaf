
output "landing_zone_name" {
    value = var.name
}

output "available_locations" {
    value = var.locations
}

output "resource_groups" {
    value = [for rg in module.resource_groups: {
        id = rg.resource_group.id       
    }]
}


