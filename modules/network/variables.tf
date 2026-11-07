variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the network will be deployed"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network (e.g., ['10.143.0.0/16'])"
}

variable "subnets" {
  type = map(object({
    address_prefixes                  = list(string)
    private_endpoint_network_policies = optional(string, "Enabled")
    service_endpoints                 = optional(list(string), [])
  }))
  description = "Map of subnets to create inside the virtual network"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the virtual network"
  default     = {}
}
