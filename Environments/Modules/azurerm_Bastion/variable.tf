variable "bastion_details" {
    description = "A map of Bastion Host configurations"
    type = map(object({
        subnet_name              = string
        resource_group_name      = string
        virtual_network_name     = string
        address_prefixes         = list(string)
        public_ip_name           = string
        location                 = string
        allocation_method        = string
        sku                      = string
        bastion_host_name       = string
        ip_configuration_name    = string
    }))
  
}