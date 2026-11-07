# 1. Azure Private DNS Zone for Storage Blob
resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# 2. Virtual Network Links to all required VNets (Hub VNet & Spoke/VM VNet)
# This enables VMs across both VNets to resolve the Private Endpoint IP via internal DNS (168.63.129.16)
resource "azurerm_private_dns_zone_virtual_network_link" "vnet_links" {
  for_each = var.linked_vnet_ids

  name                  = "link-${each.key}"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = each.value
  registration_enabled  = false
  tags                  = var.tags
}

# 3. Private Endpoint in the PE Subnet
resource "azurerm_private_endpoint" "pe" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.private_endpoint_name}-psc"
    private_connection_resource_id = var.target_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = false
  }

  # Automatically registers the A-record (storage account FQDN -> private IP) in the Private DNS Zone
  private_dns_zone_group {
    name                 = "default-dns-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.dns_zone.id]
  }
}
