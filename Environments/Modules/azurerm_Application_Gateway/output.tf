output "backend_pool_ids" {
  value = {
    for agw_key, agw in azurerm_application_gateway.appgw :
    agw_key => [for bp in agw.backend_address_pool : bp.id]
  }
}
