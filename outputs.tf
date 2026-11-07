output "resource_group_name" {
  value       = module.resource_group.name
  description = "Created Azure Resource Group"
}

output "vnet_spoke_id" {
  value       = module.vnet_spoke.vnet_id
  description = "Spoke Virtual Network ID"
}

output "vnet_hub_id" {
  value       = module.vnet_hub.vnet_id
  description = "Hub Virtual Network ID"
}

output "storage_account_name" {
  value       = module.storage.storage_account_name
  description = "Storage account name"
}

output "storage_blob_fqdn" {
  value       = module.storage.primary_blob_host
  description = "Storage blob primary FQDN (e.g. distorage123456.blob.core.windows.net)"
}

output "private_endpoint_id" {
  value       = module.private_endpoint.private_endpoint_id
  description = "Private endpoint ID"
}

output "private_endpoint_ip" {
  value       = module.private_endpoint.private_endpoint_ip
  description = "Assigned Private IP of the storage private endpoint"
}

output "private_dns_zone_name" {
  value       = module.private_endpoint.private_dns_zone_name
  description = "Private DNS Zone created for Private Link"
}

output "vm_name" {
  value       = module.compute_vm.vm_name
  description = "Name of the test VM"
}

output "vm_private_ip" {
  value       = module.compute_vm.private_ip_address
  description = "Private IP address of the VM"
}

output "vm_public_ip" {
  value       = module.compute_vm.public_ip_address
  description = "Public IP address of the VM (if enabled)"
}

output "vm_ssh_command" {
  value       = module.compute_vm.ssh_command
  description = "Command to SSH into VM"
}

output "vm_ssh_private_key" {
  value       = module.compute_vm.generated_ssh_private_key
  description = "SSH private key to connect to the VM (save as id_rsa)"
  sensitive   = true
}
