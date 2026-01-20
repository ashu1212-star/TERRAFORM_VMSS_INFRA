output "backend_pool_ids" {
  value = {
    for k, pool in azurerm_lb_backend_address_pool.lb_backend_pool :
    k => pool.id
  }
}
