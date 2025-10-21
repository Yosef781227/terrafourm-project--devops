# Resource Group Configuration

resource_group_name = "rg-webapp-container"
location = "East US"

# App Service Plan Configuration

app_service_plan_name = "asp-webapp-container"
sku_name = "B1"

# Web App Configuration

webapp_name = "webapp-container-holyyosef-webapp"
docker_image = "nginx"
docker_image_tag = "latest"

# Security & Performance Settings

https_only = true
always_on = true
container_port = 80

# Application Settings

app_settings = {
  WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
}
