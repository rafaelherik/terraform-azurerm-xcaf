
module "resource_groups" {
    source = "../../resources/resource_group"
    for_each = var.resource_groups
    name = each.value.name
    location = each.value.location
    tags = merge(var.tags, each.value.tags)
}








