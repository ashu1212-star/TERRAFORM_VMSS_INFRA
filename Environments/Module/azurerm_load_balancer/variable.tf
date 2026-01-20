variable "load_balancers" {
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