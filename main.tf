terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">=1.3.0"
}

# Variables
variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan name"
}

variable "webapp_name" {
  type        = string
  description = "Unique Web App name"
}

variable "docker_image" {
  type        = string
  description = "Docker image name"
}

variable "docker_image_tag" {
  type        = string
  description = "Docker image tag"
  default     = "latest"
}

variable "sku_name" {
  type        = string
  description = "App Service Plan SKU"
  default     = "B1"
}

variable "https_only" {
  type        = bool
  description = "Force HTTPS only"
  default     = true
}

variable "always_on" {
  type        = bool
  description = "Keep the app always on"
  default     = true
}

variable "container_port" {
  type        = number
  description = "Container port"
  default     = 80
}

variable "app_settings" {
  type        = map(string)
  description = "Application settings"
  default     = {}
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
