resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  sku_tier            = var.sku_tier

  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled

  default_node_pool {
    name                 = var.node_pool_name
    vm_size              = var.node_vm_size
    auto_scaling_enabled = var.auto_scaling_enabled
    min_count            = var.min_count
    max_count            = var.max_count
    os_disk_size_gb      = var.os_disk_size_gb

    upgrade_settings {
      max_surge = var.node_pool_max_surge
    }
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin      = var.network_plugin
    network_plugin_mode = var.network_plugin_mode
    network_policy      = var.network_policy
    load_balancer_sku   = var.load_balancer_sku
    outbound_type       = var.outbound_type

    pod_cidr       = var.pod_cidr
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = var.key_vault_secret_rotation_enabled
    secret_rotation_interval = var.key_vault_secret_rotation_interval
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = var.acr_pull_role_definition_name
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}