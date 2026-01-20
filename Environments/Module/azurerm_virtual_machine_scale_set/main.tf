resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  for_each = var.vmss

  name                = each.value.vmss_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.vmss_sku
  instances           = each.value.instance_count

  admin_username = data.azurerm_key_vault_secret.username[each.key].value
  admin_password = data.azurerm_key_vault_secret.password[each.key].value
  disable_password_authentication = false

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku_name
    version   = each.value.version
  }

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
    disk_size_gb         = each.value.os_disk_disk_size_gb
  }

  network_interface {
    name    = each.value.network_interface_name
    primary = true

    ip_configuration {
      name      = each.value.ip_configuration_name
      primary  = true
      subnet_id = data.azurerm_subnet.subnet[each.key].id

      application_gateway_backend_address_pool_ids = toset(var.backend_address_pool_ids_app_gateway["AppGateway1"])



      load_balancer_backend_address_pool_ids = toset([var.backend_address_pool_ids_lb["Lb1"]])

    }
  }
}
