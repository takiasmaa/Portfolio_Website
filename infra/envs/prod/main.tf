data "azurerm_client_config" "current" {}

module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "acr" {
  source = "../../modules/acr"

  name                = var.acr_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}

module "key_vault" {
  source = "../../modules/key-vault"

  name                          = var.key_vault_name
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.key_vault_sku_name
  soft_delete_retention_days    = var.key_vault_soft_delete_retention_days
  rbac_authorization_enabled    = var.key_vault_rbac_authorization_enabled
  purge_protection_enabled      = var.key_vault_purge_protection_enabled
  public_network_access_enabled = var.key_vault_public_network_access_enabled
  tags                          = var.tags
}

module "workload_identity" {
  source = "../../modules/managed-identity"

  name                = var.workload_identity_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  tags                = var.tags
}

module "external_secrets_federated_identity" {
  source = "../../modules/federated-identity-credential"

  name                      = "fic-external-secrets-cert-manager"
  user_assigned_identity_id = module.workload_identity.id
  issuer                    = module.aks.oidc_issuer_url
  subject                   = "system:serviceaccount:external-secrets:external-secrets"
}

module "workload_identity_key_vault_secrets_user" {
  source = "../../modules/role-assignment"

  scope                = module.key_vault.id
  role_definition_name = var.workload_identity_key_vault_role_definition_name
  principal_id         = module.workload_identity.principal_id
}

module "aks" {
  source = "../../modules/aks"

  name                = var.aks_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  dns_prefix          = var.aks_dns_prefix

  sku_tier                  = var.aks_sku_tier
  oidc_issuer_enabled       = var.aks_oidc_issuer_enabled
  workload_identity_enabled = var.aks_workload_identity_enabled

  node_pool_name       = var.aks_node_pool_name
  node_vm_size         = var.node_vm_size
  auto_scaling_enabled = var.aks_auto_scaling_enabled
  min_count            = var.min_count
  max_count            = var.max_count
  os_disk_size_gb      = var.aks_os_disk_size_gb
  node_pool_max_surge  = var.aks_node_pool_max_surge

  identity_type = var.aks_identity_type

  network_plugin                     = var.aks_network_plugin
  network_plugin_mode                = var.aks_network_plugin_mode
  network_policy                     = var.aks_network_policy
  load_balancer_sku                  = var.aks_load_balancer_sku
  outbound_type                      = var.aks_outbound_type
  pod_cidr                           = var.aks_pod_cidr
  service_cidr                       = var.aks_service_cidr
  dns_service_ip                     = var.aks_dns_service_ip
  network_data_plane                 = var.aks_network_data_plane
  key_vault_secret_rotation_enabled  = var.aks_key_vault_secret_rotation_enabled
  key_vault_secret_rotation_interval = var.aks_key_vault_secret_rotation_interval

  acr_id                        = module.acr.id
  acr_pull_role_definition_name = var.aks_acr_pull_role_definition_name

  tags = var.tags
}

# ---------------------------------------------------------------------------
# ARCHIVED / DISABLING: Azure Application Gateway for Containers
#
# This module originally enabled:
# Cloudflare -> Application Gateway for Containers -> Gateway API -> HTTPRoute.
#
# It worked successfully, but we are disabling it to reduce dev hosting cost.
# Keep this block temporarily so Terraform can explicitly patch AGC off.
# After Azure confirms the add-on is disabled, we can remove this module from
# active configuration and keep the module/folder as archived documentation.
# ---------------------------------------------------------------------------
module "aks_gateway_addons" {
  source = "../../modules/aks-gateway-addons"

  aks_id                            = module.aks.id
  application_load_balancer_enabled = false
  gateway_api_installation          = "Disabled"
}