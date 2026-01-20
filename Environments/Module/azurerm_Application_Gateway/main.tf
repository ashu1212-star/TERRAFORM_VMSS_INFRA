resource "azurerm_public_ip" "appgw_pip" {
    for_each = var.application_gateways
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_subnet" "appgw_subnet" {
    for_each = var.application_gateways
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
    address_prefixes     = each.value.address_prefixes
  
}

resource "azurerm_application_gateway" "appgw" {
    for_each = var.application_gateways
  name                = each.value.application_gateway_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration_name
    subnet_id = azurerm_subnet.appgw_subnet[each.key].id
  }

  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port_number
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgw_pip[each.key].id
  }

  backend_address_pool {
    name = each.value.backend_address_pool_name
  }

  backend_http_settings {
    name                  = each.value.backend_http_settings_name
    port                  = each.value.backend_http_settings_port
    protocol              = each.value.backend_http_settings_protocol
    cookie_based_affinity = each.value.cookie_based_affinity
    request_timeout       = each.value.request_timeout
  }

  http_listener {
    name                           = each.value.http_listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = each.value.http_listener_protocol
  }

  request_routing_rule {
    name                       = each.value.request_routing_rule_name
    rule_type                  = each.value.rule_type
    http_listener_name         = each.value.http_listener_name
    backend_address_pool_name  = each.value.backend_address_pool_name
    backend_http_settings_name = each.value.backend_http_settings_name
    priority                   = each.value.priority
  }
}
