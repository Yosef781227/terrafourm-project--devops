terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">=1.3.0"
}

provider "azurerm" {
  features {}
  # Service Principal authentication via environment variables:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
}

# Create Resource Group 
resource "azurerm_resource_group" "rg" {
  name     = "rg-webapp-container"
  location = "East US"
}

# Call the webapp-container module
module "webapp" {
  source                = "./modules/webapp-container"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
}
