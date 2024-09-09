variable "vpn_gateway" {
  type = optional(object({
    name = string
    resource_group_name = string
    location = string
    type = string
    vpn_type = string
    active_active = bool
    enable_bgp = bool
    sku = string
    ip_configuration = list(object({
      name = string
      subnet_id = string
      public_ip_address_id = string
    }))
  }), {})
}

variable "shared_key" {
  type        = string
  description = "The shared key for the VPN gateway connection"
}

resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name = var.vpn_gateway.name
  resource_group_name = var.vpn_gateway.resource_group_name
  location = var.vpn_gateway.location
  type = var.vpn_gateway.type
  vpn_type = var.vpn_gateway.vpn_type
  active_active = var.vpn_gateway.active_active
  enable_bgp = var.vpn_gateway.enable_bgp
  sku = var.vpn_gateway.sku
  
  dynamic "ip_configuration" {
    for_each = var.vpn_gateway.ip_configuration 
    content {
      name = ip_configuration.value.name != null ? ip_configuration.value.name : azurerm_public_ip.vpn_gateway_public_ip[0].name
      public_ip_address_id = ip_configuration.value.public_ip_address_id
      subnet_id = var.vpn.subnet_id
    }
  }
}


resource "azurerm_virtual_network_gateway_connection" "vpn_gateway_connection" {
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpn_gateway.id
  name                       = var.vpn_gateway.name
  resource_group_name        = var.vpn_gateway.resource_group_name
  shared_key                 = var.shared_key  // Add this line
  location = var.vpn_gateway.location
  type = var.vpn_gateway.type
}


resource "azurerm_local_network_gateway" "local_network_gateway" {
  name = var.vpn_gateway.name
  resource_group_name = var.vpn_gateway.resource_group_name
  location = var.vpn_gateway.location
  gateway_address = var.vpn_gateway.gateway_address
  address_space = var.vpn_gateway.address_space
}

