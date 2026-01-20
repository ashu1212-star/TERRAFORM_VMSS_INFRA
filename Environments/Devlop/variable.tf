variable "Rg_Detils" {
  type = map(object({
    resource_group_name = string
    location = string
  }))
}

variable "Vnet_Detils" {
  type = map(object({
    virtual_network_name = string
    resource_group_name = string
    location = string
    address_space = list(string)
  }))
}
variable "Subnet_Detils" {
  type = map(object({
    subnet_name = string
    resource_group_name = string
    virtual_network_name = string
    address_prefixes = list(string)
  }))
}

variable "sql_server" {
  type = map(object({
    sql_server_name              = string
    resource_group_name          = string
    location                     = string
    version                      = string
    admin_secret_name            = string
    password_secret_name         = string
    key_vault_name               = string
  }))
}
variable "sql_database" {
  type = map(object({
    sql_database_name = string
    sku_name          = string
    max_size_gb       = number
    sql_server_name  = string
    resource_group_name = string
  }))
}

variable "key_vault_details" {
  type = map(object({
    key_vault_name        = string
    location              = string
    resource_group_name   = string
    sku_name              = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
  }))
}

variable "key_vault_secret_details" {
  type = object({
    secrets = map(string)
  })
}

variable "bastion_details" {
    description = "A map of Bastion Host configurations"
    type = map(object({
        subnet_name              = string
        resource_group_name      = string
        virtual_network_name     = string
        address_prefixes         = list(string)
        public_ip_name           = string
        location                 = string
        allocation_method        = string
        sku                      = string
        bastion_host_name       = string
        ip_configuration_name    = string
    })) 
}

variable "application_gateway_details" {
  type = map(object({
    application_gateway_name          = string
    resource_group_name               = string
    sku_name                          = string
    sku_tier                          = string
    gateway_ip_configuration_name     = string
    frontend_port_name                = string
    frontend_port_number              = number
    frontend_ip_configuration_name    = string
    backend_address_pool_name         = string
    backend_http_settings_name        = string
    backend_http_settings_port        = number
    backend_http_settings_protocol    = string
    cookie_based_affinity             = string
    request_timeout                   = number
    http_listener_name                = string
    http_listener_protocol            = string
    request_routing_rule_name         = string
    rule_type                         = string
    priority                          = number
    sku                               = string
    virtual_network_name              = string
    public_ip_name                    = string
    location                          = string
    allocation_method                 = string
    subnet_name                       = string
    address_prefixes                 = list(string)

  }))
  
}
variable "load_balancer_details" {
  type = map(object({
    load_balancer_name               = string
    resource_group_name             = string
    location                        = string
    sku_type                        = string
    frontend_ip_configuration_name  = string
    subnet_name                     = string
    virtual_network_name            = string
    private_ip_address_allocation   = string
    backend_address_pool_name       = string
    probe_name                      = string
    protocol_probe                  = string
    protocol_rule                   = string
    port                            = number
    request_path                    = string
    rule_name                       = string
    frontend_port                   = number
    backend_port                    = number
    private_ip_address               = string
  }))
  
}


 variable "vmss_details" {
  type = map(object({
    vmss_name            = string
    resource_group_name  = string
    location             = string
    vmss_sku             = string
    instance_count       = number
    subnet_name          = string
    virtual_network_name = string
    os_disk_caching              = string
    os_disk_storage_account_type = string
    publisher           = string
    offer               = string
    sku_name            = string
    version             = string
    network_interface_name = string
    primary_nic           = bool
    ip_configuration_name = string
    primary_ip_config     = bool
    key_vault_name       = string
    username_secret_name    = string
    password_secret_name = string
    os_disk_disk_size_gb = number
    
  }))
  
}