variable "key_vault" {
    description = "A map of Key Vault configurations"
    type = map(object({
        key_vault_name                = string
        resource_group_name           = string
        location                      = string
        sku_name                      = string
        soft_delete_retention_days    = number
        purge_protection_enabled       = bool
    }))
  
}