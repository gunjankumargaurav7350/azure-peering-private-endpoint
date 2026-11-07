variable "private_endpoint_name" {
  type        = string
  description = "Name of the Private Endpoint"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group for Private Endpoint and DNS Zone"
}

variable "location" {
  type        = string
  description = "Azure region for the Private Endpoint"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where Private Endpoint NIC will be created (PE Subnet)"
}

variable "target_resource_id" {
  type        = string
  description = "Resource ID of the target resource (Storage Account)"
}

variable "subresource_names" {
  type        = list(string)
  description = "Subresource names (e.g. ['blob'])"
  default     = ["blob"]
}

variable "private_dns_zone_name" {
  type        = string
  description = "Private DNS Zone name for the service"
  default     = "privatelink.blob.core.windows.net"
}

variable "linked_vnet_ids" {
  type        = map(string)
  description = "Map of VNet name to VNet resource ID to link with the Private DNS Zone"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}
