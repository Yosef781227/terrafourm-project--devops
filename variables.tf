# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

# App Service Plan Variables
variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan name"
}

variable "sku_name" {
  type        = string
  description = "App Service Plan SKU (e.g., B1, S1, P1v3)"
  default     = "B1"
}

# Web App Variables
variable "webapp_name" {
  type        = string
  description = "Unique Web App name"
}

variable "docker_image" {
  type        = string
  description = "Docker image name (e.g., nginx)"
}

variable "docker_image_tag" {
  type        = string
  description = "Docker image tag (e.g., latest)"
  default     = "latest"
}

# Security & Performance Variables
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
  description = "Optional container port; sets WEBSITES_PORT app setting when provided"
  default     = null
}

# Application Settings
variable "app_settings" {
  type        = map(string)
  description = "Optional application settings to set on the Web App"
  default     = {}
}
