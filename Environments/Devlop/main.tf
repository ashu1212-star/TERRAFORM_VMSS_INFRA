module "RG" {
  source = "../Module/azurerm_resource_group"
  resource_groups = var.Rg_Detils
}
module "Vnet" {
    depends_on = [ module.RG ]
  source = "../Module/azurerm_virtual_network"
  virtual_networks = var.Vnet_Detils
}
module "Subnet" {
    depends_on = [ module.Vnet ]
  source = "../Module/azurerm_subnet"
  subnets = var.Subnet_Detils
}
module "SQL_Server" {
    depends_on = [ module.RG , module.key_vault_secret ]
  source = "../Module/azurerm_sql_server"
  sql_servers = var.sql_server
}
module "SQL_Database" {
    depends_on = [ module.SQL_Server ]
  source = "../Module/azurerm_sql_database"
  sql_databases = var.sql_database
}

module "key_vault" {
    depends_on = [ module.RG ]
  source = "../Module/azurerm_key_vault"
  key_vault = var.key_vault_details
  
}

module "key_vault_secret" {
    depends_on = [ module.key_vault ]
  source = "../Module/azurerm_key_vault_secret"
  key_vault_secrets = var.key_vault_secret_details
   kv_id = module.key_vault.kv_id["kv"]

}   

module "Bastion" {
    depends_on = [ module.Subnet, module.RG ]
  source = "../Module/azurerm_Bastion"
  bastion_details = var.bastion_details
}

module "Application_Gateway" {
    depends_on = [ module.Subnet, module.RG ]
  source = "../Module/azurerm_Application_Gateway"
  application_gateways = var.application_gateway_details
}

module "load_balancer" {
    depends_on = [ module.Subnet, module.RG ]
  source = "../Module/azurerm_load_balancer"
  load_balancers = var.load_balancer_details
  
}

module "VMSS" {
    depends_on = [ module.load_balancer, module.Application_Gateway, module.key_vault_secret ]
  source = "../Module/azurerm_virtual_machine_scale_set"
  vmss = var.vmss_details
    backend_address_pool_ids_lb = module.load_balancer.backend_pool_ids
    backend_address_pool_ids_app_gateway = module.Application_Gateway.backend_pool_ids
    
}