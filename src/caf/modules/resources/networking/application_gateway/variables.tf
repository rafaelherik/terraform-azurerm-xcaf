variable "name" {
    description = "The name of the application gateway"
    type = string
}

variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
}

variable "location" {
    description = "The location of the application gateway"
    type = string
}

variable "tags" {
    description = "The tags of the application gateway"
    type = map(string)
}

variable "sku" {
    description = "The sku of the application gateway"
    type = object({
        name = string
        tier = string
        capacity = number
    })
}

variable "subnet_name" {
    description = "The name of the subnet"
    type = string
}

variable "public_ip_address_id" {
    description = "The id of the public ip address"
    type = string
}

variable "backend_http_settings" {
    description = "The backend http settings"
    type = list(object({
        name = string
        port = number
        protocol = string
    }))
}

variable "request_routing_rules" {
    description = "The request routing rules"
    type = list(object({
        name = string
        rule_type = string
        http_listener_name = string
        backend_address_pool_name = string
    }))
}

variable "frontend_ip_configurations" {
    description = "The name of the frontend ip configuration"
    type = list(object({
        name = string
        public_ip_address_id = string
    }))
}

variable "frontend_port_name" {
    description = "The name of the frontend port"
    type = string
}

variable "protocol" {
    description = "The protocol of the frontend port"
    type = string
}

variable "virtual_network_name" {
    description = "The name of the virtual network"
    type = string
}

variable "virtual_network_resource_group_name" {
    description = "The name of the virtual network resource group"
    type = string
}   

variable "public_ip_name" {
    description = "The name of the public ip"
    type = string
}

variable "backend_address_pools" {
    description = "The name of the backend address pool"
    type = list(object({
        name = string
    }))
}


variable "public_ip_addresses" {
    description = "The public ip addresses"
    type = map(object({
        name = string
    }))
}
