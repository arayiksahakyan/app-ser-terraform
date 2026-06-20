output "id" {
  description = "Windows Web App ID."
  value       = azurerm_windows_web_app.this.id
}

output "name" {
  description = "Windows Web App name."
  value       = azurerm_windows_web_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the Windows Web App."
  value       = azurerm_windows_web_app.this.default_hostname
}
