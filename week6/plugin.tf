#terrafromprovider
terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.29.1"
      }
    }
  }

#provider and subscription 
provider "azurerm" {
  subscription_id = "bfa5d97b-bcb7-4de5-844e-74c2758afdd2"
  features {}
}

