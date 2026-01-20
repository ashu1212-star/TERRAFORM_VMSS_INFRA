Rg_Detils = {
  "Rg1" = {
    resource_group_name = "Dev-Rg"
    location            = "central india"
    
  }
}
Vnet_Detils = {
  "Vnet1" = {
    virtual_network_name = "Dev-Vnet"
    resource_group_name  = "Dev-Rg"
    location             = "central india"
    address_space        = ["10.0.0.0/16"]
    }
   
}
Subnet_Detils = {
  "Subnet1" = {
    subnet_name          = "frontend-Subnet1"
    resource_group_name  = "Dev-Rg"
    virtual_network_name = "Dev-Vnet"
    address_prefixes     = ["10.0.1.0/24"]
    }
    
    "Subnet2" = {
        subnet_name          = "backend-Subnet2"
        resource_group_name  = "Dev-Rg"
        virtual_network_name = "Dev-Vnet"
        address_prefixes     = ["10.0.2.0/24"]
    }
}

sql_server = {
  "SqlServer1" = {
    sql_server_name              = "dev-sqlserver321"
    resource_group_name          = "Dev-Rg"
    location                     = "central india"
    version                      = "12.0"
    admin_secret_name            = "sql-admin-username"
    password_secret_name         = "sql-admin-password"
    key_vault_name               = "dev-keyvault-321"

  }
}
sql_database = {
  "SqlDatabase1" = {
    sql_database_name = "dev-sqldb"
    sku_name          = "S0"
    max_size_gb       = 10
    sql_server_name   = "dev-sqlserver321"
    resource_group_name = "Dev-Rg"
  }
}

key_vault_details = {
  "kv" = {
    key_vault_name        = "dev-keyvault-321"
    location              = "central india"
    resource_group_name   = "Dev-Rg"
    sku_name              = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled     = false
    
  }
}

key_vault_secret_details = {
  secrets = {
    sql-admin-username = "sqluser"
    sql-admin-password = "P@ssword1234"
    vmss-user1        = "vmssadmin1"
    vmss-password1    = "VmssP@ssword1"
    vmss-user2        = "vmssadmin2"
    vmss-password2    = "VmssP@ssword2"
  }
}

bastion_details = {
  "Bastion1" = {
    subnet_name             = "AzureBastionSubnet"
    resource_group_name     = "Dev-Rg"
    virtual_network_name    = "Dev-Vnet"
    address_prefixes        = ["10.0.4.0/26"]
    public_ip_name          = "dev-bastion-pip"
    location                = "central india"
    allocation_method       = "Static"
    sku                     = "Standard"
    bastion_host_name       = "dev-bastion-host"
    ip_configuration_name   = "dev-bastion-ip-config"
    }
}

application_gateway_details = {
  "AppGateway1" = {
    application_gateway_name          = "dev-appgw"
    resource_group_name               = "Dev-Rg"
    location                          = "central india"
    gateway_ip_configuration_name     = "appgw-ipcfg"
    frontend_port_name                = "fe-port"
    frontend_port_number              = 80
    frontend_ip_configuration_name    = "fe-ip"
    backend_address_pool_name         = "backend-pool"
    backend_http_settings_name        = "http-settings"
    backend_http_settings_port        = 80
    backend_http_settings_protocol    = "Http"
    cookie_based_affinity             = "Disabled"
    request_timeout                   = 30
    http_listener_name                = "http-listener"
    http_listener_protocol            = "Http"
    request_routing_rule_name         = "rule1"
    rule_type                         = "Basic"
    priority                          = 100
    sku_name                          = "Standard_v2"
    sku_tier                          = "Standard_v2"
    sku                               = "Standard"
    virtual_network_name              = "Dev-Vnet"
    public_ip_name                    = "dev-appgw-pip"
    allocation_method                 = "Static"
    subnet_name                       = "appgw-Subnet"
    address_prefixes                 = ["10.0.3.0/28"]

  }
}
load_balancer_details = {
  "Lb1" = {
    load_balancer_name               = "dev-lb"
    resource_group_name             = "Dev-Rg"
    location                        = "central india"
    sku_type                        = "Standard"
    frontend_ip_configuration_name  = "dev-lb-fe-ip"
    subnet_name                     = "Backend-Subnet2"
    virtual_network_name            = "Dev-Vnet"
    private_ip_address_allocation   = "Static"
    backend_address_pool_name       = "dev-lb-backend-pool"
    probe_name                      = "dev-lb-probe"
    protocol_probe                  = "Http"
    protocol_rule                   = "Tcp"
    port                            = 80
    request_path                    = "/"
    rule_name                       = "dev-lb-rule"
    frontend_port                   = 80
    backend_port                    = 80
    private_ip_address               = "10.0.2.10"
  }
}

vmss_details = {
  "frontend_vmss" = {
    vmss_name            = "dev-frontend-vmss"
    resource_group_name  = "Dev-Rg"
    location             = "central india"
    vmss_sku             = "Standard_D2s_v3"
    instance_count       = 1
    subnet_name          = "frontend-Subnet1"
    virtual_network_name = "Dev-Vnet"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Premium_LRS"
    publisher           = "Canonical"
    offer               = "UbuntuServer"
    sku_name            = "18.04-LTS"
    version             = "latest"
    network_interface_name = "dev-frontend-nic"
    primary_nic           = true
    ip_configuration_name = "dev-frontend-ip-config"
    primary_ip_config     = true
    key_vault_name       = "dev-keyvault-321"
    username_secret_name    = "vmss-user1"
    password_secret_name = "vmss-password1"
    os_disk_disk_size_gb = 30
  }

    "backend_vmss" = {
        vmss_name            = "dev-backend-vmss"
        resource_group_name  = "Dev-Rg"
        location             = "central india"
        vmss_sku             = "Standard_D2s_v3"
        instance_count       = 1
        subnet_name          = "backend-Subnet2"
        virtual_network_name = "Dev-Vnet"
        os_disk_caching              = "ReadWrite"
        os_disk_storage_account_type = "Premium_LRS"
        publisher           = "Canonical"
        offer               = "UbuntuServer"
        sku_name            = "18.04-LTS"
        version             = "latest"
        network_interface_name = "dev-backend-nic"
        primary_nic           = true
        ip_configuration_name = "dev-backend-ip-config"
        primary_ip_config     = true
        key_vault_name       = "dev-keyvault-321"
        username_secret_name    = "vmss-user2"
        password_secret_name = "vmss-password2"
        os_disk_disk_size_gb = 30
    }
}