output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network"
}

output "vnet_address_space" {
  value       = azurerm_virtual_network.vnet.address_space
  description = "The address space of the Virtual Network"
}

output "subnet_ids" {
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
  description = "Map of subnet names to their resource IDs"
}

output "subnets" {
  value       = azurerm_subnet.subnets
  description = "Full subnet objects"
}
