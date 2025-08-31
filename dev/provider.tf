terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.15.2"
    }
  }
  
}

provider "azurerm" {
  features {}
  # subscription_id = "f030911e-4fce-4b40-9805-8c13a36a3a96"


}