variable "source_vnet_name" {
  type        = string
  description = "Name of the source Virtual Network"
}

variable "source_resource_group_name" {
  type        = string
  description = "Resource group of the source Virtual Network"
}

variable "source_vnet_id" {
  type        = string
  description = "Resource ID of the source Virtual Network"
}

variable "target_vnet_name" {
  type        = string
  description = "Name of the target Virtual Network"
}

variable "target_resource_group_name" {
  type        = string
  description = "Resource group of the target Virtual Network"
}

variable "target_vnet_id" {
  type        = string
  description = "Resource ID of the target Virtual Network"
}

variable "allow_virtual_network_access" {
  type        = bool
  description = "Controls if traffic from the VMs in the remote virtual network is allowed to reach VMs in this virtual network"
  default     = true
}

variable "allow_forwarded_traffic" {
  type        = bool
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed"
  default     = true
}

variable "allow_gateway_transit" {
  type        = bool
  description = "Controls gatewayLinks can be used in the remote virtual network's link to the local virtual network"
  default     = false
}

variable "use_remote_gateways" {
  type        = bool
  description = "Controls if remote gateways can be used on the local virtual network"
  default     = false
}
