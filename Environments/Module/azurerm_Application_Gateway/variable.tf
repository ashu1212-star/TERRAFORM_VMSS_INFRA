variable "application_gateways" {
  description = "A map of Application Gateway configurations"
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
    subnet_name                     = string
    address_prefixes                 = list(string)
  }))
  
}