resource "azurerm_mssql_server" "server" {
    for_each = var.sql_servers
    name                         = each.value.sql_server_name
    resource_group_name          = each.value.resource_group_name
    location                     = each.value.location
    version                      = each.value.version
    administrator_login          = data.azurerm_key_vault_secret.sql_admin[each.key].value
    administrator_login_password = data.azurerm_key_vault_secret.sql_password[each.key].value

     
}