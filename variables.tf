variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "rg-peering-private-endpoint"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "eastus"
}

variable "vnet_spoke_name" {
  type        = string
  description = "Name of Spoke / VM Virtual Network"
  default     = "vnet-spoke-workload"
}

variable "vnet_spoke_address_space" {
  type        = list(string)
  description = "Address space for Spoke VNet"
  default     = ["10.143.0.0/16"]
}

variable "snet_vm_address_prefixes" {
  type        = list(string)
  description = "Address prefix for VM subnet"
  default     = ["10.143.0.0/24"]
}

variable "vnet_hub_name" {
  type        = string
  description = "Name of Hub Virtual Network"
  default     = "vnet-hub-core"
}

variable "vnet_hub_address_space" {
  type        = list(string)
  description = "Address space for Hub VNet"
  default     = ["10.124.0.0/16"]
}

variable "snet_pe_address_prefixes" {
  type        = list(string)
  description = "Address prefix for Private Endpoint subnet"
  default     = ["10.124.2.0/24"]
}

variable "storage_account_prefix" {
  type        = string
  description = "Prefix for storage account"
  default     = "distorage"
}

variable "blob_container_name" {
  type        = string
  description = "Name of container in storage account"
  default     = "blob-container"
}

variable "vm_name" {
  type        = string
  description = "Name of the Linux VM"
  default     = "vm-client-01"
}

variable "vm_size" {
  type        = string
  description = "VM SKU size"
  default     = "Standard_B1s"
}

variable "vm_admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "vm_enable_public_ip" {
  type        = bool
  description = "Attach public IP to VM for SSH management during test"
  default     = true
}

variable "vm_ssh_allowed_source_ip" {
  type        = string
  description = "Allowed source CIDR for SSH access to VM (* for any, or specific IP)"
  default     = "*"
}

variable "tags" {
  type        = map(string)
  description = "Tags to attach to resources"
  default = {
    Environment = "PoC"
    Project     = "PrivateEndpoint-Peering-Demo"
    ManagedBy   = "Terraform"
  }
}
