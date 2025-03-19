output "app_service_default_hostname" {
  value       = azurerm_linux_web_app.docunexus_app_service.default_hostname
  description = "Default hostname of the Azure App Service"
}

output "resource_group_name" {
  value = azurerm_resource_group.docunexus_rg.name
  description = "Name of the resource group created"
}
