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

  # Token authentication (use environment variables from az login or service principal)
  use_cli = true
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
  app_service_plan_name = "asp-webapp-container"
  webapp_name           = "webapp-container-holyyosef-webapp" # must be globally unique
  docker_image          = "nginx"
  docker_image_tag      = "latest"
  sku_name              = "B1"
  https_only            = true
  always_on             = true
  container_port        = 80
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }
}
