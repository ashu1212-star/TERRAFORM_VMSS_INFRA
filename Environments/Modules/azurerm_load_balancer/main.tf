resource "azurerm_lb" "internal_lb" {
    for_each = var.load_balancers
  name                = each.value.load_balancer_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku_type

  frontend_ip_configuration {
    name                          = each.value.frontend_ip_configuration_name
    subnet_id                     = data.azurerm_subnet.Lb_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    private_ip_address = each.value.private_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
    for_each = var.load_balancers
  name            = each.value.backend_address_pool_name
  loadbalancer_id = azurerm_lb.internal_lb[each.key].id
}

resource "azurerm_lb_probe" "http_probe" {
    for_each = var.load_balancers
  name            = each.value.probe_name
  loadbalancer_id = azurerm_lb.internal_lb[each.key].id
  protocol        = each.value.protocol_probe
  port            = each.value.port
  request_path    = each.value.request_path
}

resource "azurerm_lb_rule" "lb_rule" {
    for_each = var.load_balancers
  name                           = each.value.rule_name
  loadbalancer_id                = azurerm_lb.internal_lb[each.key].id
  protocol                       = each.value.protocol_rule
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.http_probe[each.key].id
}
