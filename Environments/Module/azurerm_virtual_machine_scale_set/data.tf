
data "azurerm_subnet" "subnet" {
  for_each             = var.vmss
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.vmss
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each     = var.vmss
  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each     = var.vmss
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
