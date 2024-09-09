module "hub-lzn" {
    locations = ["westeurope"]
    source = "../lzn"
    name = "hub-lzn"
    resource_groups = {
        hub-rg = {
            name = "hub-rg"
            location = "westeurope"
        }
    }
    networking = {
        vnets = {
            hub-vnet = {
                name = "hub-vnet"
                address_space = ["10.0.0.0/16"]
                subnets = {
                    default = {
                        name = "default"
                        address_prefixes = ["10.0.0.0/24"]
                    }
                }
            }

        private_dns_zones = {
            hub_private_dns = {
                name = "hub.privatelink.azure.com"
                resource_group_name = "hub-rg"
                location = "westeurope"
                tags = {
                    lz = "hub"
                }
                a_records = [
                    {
                        name = "sql-1"
                        ttl = 3600
                        records = ["10.0.0.1"]
                    }
                ]
                cname_records = [
                    {
                        name = "sql-2"
                        ttl = 3600
                        record = "sql.hub.privatelink.azure.com"
                    }
                ]
                mx_records = []
                srv_records = []
                txt_records = []
                ptr_records = []
            }
        }
        }
    }
    tags = {
        lz = "hub"
    }
}