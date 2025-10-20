output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}

output "webapp_id" {
  value = azurerm_linux_web_app.webapp.id
}

output "app_service_plan_id" {
  value = azurerm_service_plan.asp.id
}