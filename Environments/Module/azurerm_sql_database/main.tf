resource "azurerm_mssql_database" "DB" {
  for_each    = var.sql_databases
  name        = each.value.sql_database_name
  server_id   = data.azurerm_mssql_server.server[each.key].id
  sku_name    = each.value.sku_name
  max_size_gb = each.value.max_size_gb

}
