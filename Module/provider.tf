terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}

provider "azurerm" {
    features{}
    subscription_id = "8b10287d-12d6-41e3-b62c-33457c006e96"
  # Configuration options
}