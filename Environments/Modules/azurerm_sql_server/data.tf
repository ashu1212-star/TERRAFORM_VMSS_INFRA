data "azurerm_key_vault" "kv" {
  for_each = var.sql_servers
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
  
}


data "azurerm_key_vault_secret" "sql_admin"{
  for_each = var.sql_servers
  name         = each.value.admin_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
  
}

data "azurerm_key_vault_secret" "sql_password"{
  for_each = var.sql_servers
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
  
}