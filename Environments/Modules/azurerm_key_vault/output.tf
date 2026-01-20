output "kv_id" {
  value = {
    for key, kv in azurerm_key_vault.kv : key => kv.id
  }
}
