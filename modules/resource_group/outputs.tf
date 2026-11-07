output "name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the Resource Group"
}

output "id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the Resource Group"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of the Resource Group"
}
