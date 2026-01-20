variable "key_vault_secrets" {
  description = "A map of Key Vault Secret configurations"
  type = object({
    secrets = map(string)
  })
}


variable "kv_id" {
  description = "The ID of the Key Vault where secrets will be stored"
  type        = string
}