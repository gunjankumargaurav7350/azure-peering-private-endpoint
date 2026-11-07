# ==============================================================================
# 1. Resource Group
# ==============================================================================
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# ==============================================================================
# 2. Virtual Networks (VNet 1 - VM / Spoke & VNet 2 - Hub)
# ==============================================================================

# VNet 1: VM / Spoke Virtual Network (10.143.0.0/16)
module "vnet_spoke" {
  source              = "./modules/network"
  vnet_name           = var.vnet_spoke_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_spoke_address_space

  subnets = {
    "snet-vm" = {
      address_prefixes                  = var.snet_vm_address_prefixes
      private_endpoint_network_policies = "Enabled"
    }
  }

  tags = var.tags
}

# VNet 2: Hub Virtual Network (10.124.0.0/16)
module "vnet_hub" {
  source              = "./modules/network"
  vnet_name           = var.vnet_hub_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_hub_address_space

  subnets = {
    "snet-pe" = {
      address_prefixes                  = var.snet_pe_address_prefixes
      private_endpoint_network_policies = "Enabled"
    }
  }

  tags = var.tags
}

# ==============================================================================
# 3. Virtual Network Peering (Bidirectional between Hub and Spoke VNets)
# ==============================================================================
module "vnet_peering" {
  source                     = "./modules/vnet_peering"
  source_vnet_name           = module.vnet_spoke.vnet_name
  source_resource_group_name = module.resource_group.name
  source_vnet_id             = module.vnet_spoke.vnet_id

  target_vnet_name           = module.vnet_hub.vnet_name
  target_resource_group_name = module.resource_group.name
  target_vnet_id             = module.vnet_hub.vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

# ==============================================================================
# 4. Azure Storage Account & Blob Container
# ==============================================================================
module "storage" {
  source                        = "./modules/storage"
  storage_account_prefix        = var.storage_account_prefix
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  container_name                = var.blob_container_name
  public_network_access_enabled = false
  tags                          = var.tags
}

# ==============================================================================
# 5. Private Endpoint & Private DNS Zone (privatelink.blob.core.windows.net)
# ==============================================================================
module "private_endpoint" {
  source                = "./modules/private_endpoint"
  private_endpoint_name = "pe-${module.storage.storage_account_name}-blob"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  subnet_id             = module.vnet_hub.subnet_ids["snet-pe"]
  target_resource_id    = module.storage.storage_account_id
  subresource_names     = ["blob"]
  private_dns_zone_name = "privatelink.blob.core.windows.net"

  # Link Private DNS Zone to both VNets so Spoke VM resolves private endpoint IP (10.124.2.4)
  linked_vnet_ids = {
    "spoke-vnet" = module.vnet_spoke.vnet_id
    "hub-vnet"   = module.vnet_hub.vnet_id
  }

  tags = var.tags

  depends_on = [
    module.vnet_peering
  ]
}

# ==============================================================================
# 6. Test Client VM in VNet 1 (VM Subnet 10.143.0.0/24)
# ==============================================================================
module "compute_vm" {
  source                    = "./modules/compute_vm"
  vm_name                   = var.vm_name
  resource_group_name       = module.resource_group.name
  location                  = module.resource_group.location
  subnet_id                 = module.vnet_spoke.subnet_ids["snet-vm"]
  vm_size                   = var.vm_size
  admin_username            = var.vm_admin_username
  enable_public_ip          = var.vm_enable_public_ip
  ssh_source_address_prefix = var.vm_ssh_allowed_source_ip
  tags                      = var.tags
}
