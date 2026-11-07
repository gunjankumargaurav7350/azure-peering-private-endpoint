output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "The ID of the Linux Virtual Machine"
}

output "vm_name" {
  value       = azurerm_linux_virtual_machine.vm.name
  description = "The name of the VM"
}

output "private_ip_address" {
  value       = azurerm_network_interface.vm_nic.private_ip_address
  description = "The private IP address of the VM"
}

output "public_ip_address" {
  value       = var.enable_public_ip ? azurerm_public_ip.vm_pip[0].ip_address : null
  description = "The public IP address of the VM (if enabled)"
}

output "admin_username" {
  value       = var.admin_username
  description = "Admin username for SSH login"
}

output "generated_ssh_private_key" {
  value       = var.admin_ssh_public_key == null ? tls_private_key.vm_ssh[0].private_key_pem : null
  description = "Auto-generated private key for SSH (sensitive)"
  sensitive   = true
}

output "ssh_command" {
  value       = var.enable_public_ip ? "ssh -i id_rsa ${var.admin_username}@${azurerm_public_ip.vm_pip[0].ip_address}" : "ssh ${var.admin_username}@${azurerm_network_interface.vm_nic.private_ip_address}"
  description = "Convenient SSH command to connect to the VM"
}
