output "source_to_target_peering_id" {
  value       = azurerm_virtual_network_peering.source_to_target.id
  description = "The ID of the source to target peering"
}

output "target_to_source_peering_id" {
  value       = azurerm_virtual_network_peering.target_to_source.id
  description = "The ID of the target to source peering"
}
