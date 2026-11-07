variable "storage_account_prefix" {
  type        = string
  description = "Prefix for storage account name (alphanumeric, max 18 chars)"
  default     = "distorage"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the storage account"
}

variable "account_tier" {
  type        = string
  description = "Storage account tier"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Replication type (LRS, GRS, etc.)"
  default     = "LRS"
}

variable "container_name" {
  type        = string
  description = "Name of the default blob container"
  default     = "demo-container"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Enable or disable public network access to storage account"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to storage resources"
  default     = {}
}
