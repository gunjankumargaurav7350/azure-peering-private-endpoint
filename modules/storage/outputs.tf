output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "The ID of the storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The name of the storage account"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.storage.primary_blob_endpoint
  description = "The endpoint URL for blob storage"
}

output "primary_blob_host" {
  value       = azurerm_storage_account.storage.primary_blob_host
  description = "The host name for blob storage (e.g., distorage123456.blob.core.windows.net)"
}

output "container_name" {
  value       = azurerm_storage_container.container.name
  description = "The name of the created blob container"
}

output "primary_access_key" {
  value       = azurerm_storage_account.storage.primary_access_key
  description = "Primary access key of the storage account"
  sensitive   = true
}
