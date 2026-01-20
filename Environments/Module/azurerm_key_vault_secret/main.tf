resource "azurerm_key_vault_secret" "secret" {
  for_each = var.key_vault_secrets.secrets
  name         = each.key
  value        = each.value
  key_vault_id = var.kv_id
}