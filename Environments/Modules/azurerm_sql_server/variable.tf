variable "sql_servers" {
  description = "A map of SQL Server configurations"
  type = map(object({
    sql_server_name              = string
    resource_group_name          = string
    location                     = string
    version                      = string
   admin_secret_name            = string
   password_secret_name         = string
   key_vault_name              = string
   
  }))
}