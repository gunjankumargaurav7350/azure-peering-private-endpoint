output "private_endpoint_id" {
  value       = azurerm_private_endpoint.pe.id
  description = "The ID of the Private Endpoint"
}

output "private_endpoint_ip" {
  value       = azurerm_private_endpoint.pe.custom_dns_configs[0].ip_addresses[0]
  description = "The assigned Private IP of the Private Endpoint"
}

output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.dns_zone.id
  description = "The ID of the Private DNS Zone"
}

output "private_dns_zone_name" {
  value       = azurerm_private_dns_zone.dns_zone.name
  description = "The name of the Private DNS Zone"
}

output "network_interface_id" {
  value       = azurerm_private_endpoint.pe.network_interface[0].id
  description = "The network interface ID automatically created for the Private Endpoint"
}
