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
  resource_provider_registrations = "none"
  # Service Principal authentication via environment variables:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
}

# Create Resource Group 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Call the webapp-container module
module "webapp" {
  source                = "./modules/webapp-container"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  app_service_plan_name = var.app_service_plan_name
  webapp_name           = var.webapp_name
  docker_image          = var.docker_image
  docker_image_tag      = var.docker_image_tag
  sku_name              = var.sku_name
  https_only            = var.https_only
  always_on             = var.always_on
  container_port        = var.container_port
  app_settings          = var.app_settings
}
