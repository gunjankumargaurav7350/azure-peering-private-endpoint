variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resource group"
  default     = {}
}
