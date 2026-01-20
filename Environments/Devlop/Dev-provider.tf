terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "Rg-Dev"
    storage_account_name = "storagedevnewal"
    container_name = "devcontainer"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cee0390d-e978-488c-9e05-8a5ae75fb62c"
}