terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "925c3861-e9e3-43c1-8a0c-d6faefd4a05a"
}
