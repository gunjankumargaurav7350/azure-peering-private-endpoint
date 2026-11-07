variable "vm_name" {
  type        = string
  description = "Name of the Linux Virtual Machine"
  default     = "vm-test-client"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where VM is located"
}

variable "location" {
  type        = string
  description = "Azure region for the VM"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where VM network interface will be placed"
}

variable "vm_size" {
  type        = string
  description = "Size/SKU of the Virtual Machine"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  type        = string
  description = "Optional existing SSH public key. If null, a new key is generated."
  default     = null
}

variable "enable_public_ip" {
  type        = bool
  description = "Whether to attach a Public IP to the VM for testing/SSH access"
  default     = true
}

variable "ssh_source_address_prefix" {
  type        = string
  description = "Allowed source IP for SSH access (e.g. your public IP or '*')"
  default     = "*"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to VM resources"
  default     = {}
}
