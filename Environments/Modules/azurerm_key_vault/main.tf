resource "azurerm_key_vault" "kv" {
    for_each = var.key_vault
    name                        = each.value.key_vault_name
    location                    = each.value.location
    resource_group_name         = each.value.resource_group_name
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    sku_name                    = each.value.sku_name
    soft_delete_retention_days  = each.value.soft_delete_retention_days
    purge_protection_enabled = each.value.purge_protection_enabled

 access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List","Create","Delete","Update","Recover","Backup","Restore",
    ]

    secret_permissions = [
      "Get","List","Set","Delete","Recover","Backup","Restore",
    ]

    storage_permissions = [
      "Get","List","Set","Delete","Update","Recover","Backup","Restore",
    ]
  }
}

