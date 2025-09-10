terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f030911e-4fce-4b40-9805-8c13a36a3a96"
}