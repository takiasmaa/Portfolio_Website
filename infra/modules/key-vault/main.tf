resource "azurerm_key_vault" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  # different from ACR, KV has sku_name instead of sku
  sku_name                      = var.sku_name
  soft_delete_retention_days    = var.soft_delete_retention_days
  rbac_authorization_enabled    = var.rbac_authorization_enabled
  purge_protection_enabled      = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags
}