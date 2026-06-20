output "id" {
  description = "Traffic Manager profile ID."
  value       = azurerm_traffic_manager_profile.this.id
}

output "fqdn" {
  description = "Traffic Manager profile FQDN."
  value       = azurerm_traffic_manager_profile.this.fqdn
}
