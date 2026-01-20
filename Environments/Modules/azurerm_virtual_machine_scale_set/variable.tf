variable "vmss" {
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

variable "backend_address_pool_ids_lb" {
    type = any
  
}
variable "backend_address_pool_ids_app_gateway" {
    type = any
}