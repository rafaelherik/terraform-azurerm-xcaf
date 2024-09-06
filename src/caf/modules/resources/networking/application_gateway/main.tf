data "azurerm_public_ip" "public_ip" {
    name = var.public_ip_name
    resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
}


resource "azurerm_application_gateway" "application_gateway" {
    name = var.name
    resource_group_name = var.resource_group_name
    location = var.location
    tags = var.tags

    sku {
        name     = var.sku.name
        tier     = var.sku.tier
        capacity = var.sku.capacity
    }

   

    gateway_ip_configuration {
        name      = "gateway-ip-config"
        subnet_id = data.azurerm_subnet.subnet.id.name
    }

   

    frontend_port {
        name = "frontend-port"
        port = 80
    }

    dynamic frontend_ip_configuration {
        for_each = var.frontend_ip_configurations
        content {
            name                 = "frontend_ip_config"
            public_ip_address_id = data.azurerm_public_ip.public_ip.id
        }
    }

    dynamic backend_http_settings {
        for_each = var.backend_http_settings
        content {
            name                  = each.value.name
            cookie_based_affinity = each.value.cookie_based_affinity
            path                  = each.value.path
            port                  = each.value.port
            protocol              = each.value.protocol
            request_timeout       = each.value.request_timeout
        }   
    }

    dynamic "request_routing_rule" {
        for_each = var.request_routing_rules
        content {
            name                       = each.value.name
            rule_type                  = each.value.rule_type
            http_listener_name         = each.value.http_listener_name
            backend_address_pool_name  = each.value.backend_address_pool_name
            backend_http_settings_name = each.value.backend_http_settings_name
        }
    }

    http_listener {
        name = "listener-1"
        frontend_ip_configuration_name = "frontend-ip-config"
        frontend_port_name = "frontend-port"
        protocol = "Http"
    }

   

    dynamic backend_address_pool {
        for_each = var.backend_address_pools
        content {   
            name = "backend-address-pool"
        }
    }

}
