variable "sql_databases" {
  description = "A map of SQL Database configurations"
  type = map(object({
    sql_database_name = string
    sku_name          = string
    max_size_gb       = number
    sql_server_name   = string
    resource_group_name = string
  }))
}