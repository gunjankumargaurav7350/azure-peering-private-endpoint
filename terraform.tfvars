resource_group_name = "rg-hubspoke-storage-pe"
location            = "eastus"

# VNet 1 (Spoke / Workload)
vnet_spoke_name          = "vnet-spoke-10-143"
vnet_spoke_address_space = ["10.143.0.0/16"]
snet_vm_address_prefixes = ["10.143.0.0/24"]

# VNet 2 (Hub)
vnet_hub_name            = "vnet-hub-10-124"
vnet_hub_address_space   = ["10.124.0.0/16"]
snet_pe_address_prefixes = ["10.124.2.0/24"]

# Storage Account & Blob
storage_account_prefix = "distorage"
blob_container_name    = "blob-container"

# Client VM
vm_name                  = "vm-test-client"
vm_size                  = "Standard_B1s"
vm_admin_username        = "azureuser"
vm_enable_public_ip      = true
vm_ssh_allowed_source_ip = "*"

tags = {
  Environment = "PoC"
  Architect   = "DevOps-Team"
  ManagedBy   = "Terraform"
}
