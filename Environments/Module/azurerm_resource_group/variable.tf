variable "resource_groups" {
    description = "A map of resource groups to create"
    type = map(object({
        resource_group_name = string
        location            = string
    }))
}
  
  
