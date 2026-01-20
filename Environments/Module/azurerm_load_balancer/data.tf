data "azurerm_subnet" "Lb_subnet" {
  for_each             = var.load_balancers
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
