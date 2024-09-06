locals {
  tags = var.landing_zone.tags
  
  # Combine Key Vault keys and directly provided keys
  all_ssh_keys = concat(
    [for secret in data.azurerm_key_vault_secret.ssh_public_keys : secret.value],
    var.ssh_keys
  )
}

# Associated Key Vault to retrieve secrets
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault.name
  resource_group_name = var.key_vault.resource_group_name
}



data "azurerm_key_vault_secret" "ssh_public_keys" {
  for_each     = toset(var.os_profile_linux_config.ssh_keys_secret_names)
  name         = each.value
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "admin_password" {  
  name         = var.os_profile.admin_password_secret
  key_vault_id = data.azurerm_key_vault.key_vault.id
}




resource "azurerm_virtual_machine" "vm" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  vm_size               = var.size
  network_interface_ids = var.network_interface_ids

  storage_os_disk {
    name              = "${var.name}-osdisk"
    caching           = var.os_disk_caching
    create_option     = var.os_disk_create_option
    managed_disk_type = var.os_disk_managed_disk_type
  }

  storage_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  os_profile {
    computer_name  = var.os_profile.computer_name
    admin_username = var.os_profile.admin_username
    admin_password = var.os_profile.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = var.os_profile_linux_config.disable_password_authentication

    dynamic "ssh_keys" {
      for_each = local.all_ssh_keys
      content {
        path     = "/home/${var.os_profile.admin_username}/.ssh/authorized_keys"
        key_data = ssh_keys.value
      }
    }
  }

  tags = merge(local.tags, var.tags)
}


