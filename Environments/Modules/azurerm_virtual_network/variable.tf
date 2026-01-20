variable "virtual_networks" {
    description = "A map of virtual networks to create"
    type = map(object({
        virtual_network_name = string
        resource_group_name  = string
        location             = string
        address_space        = list(string)
    }))
}