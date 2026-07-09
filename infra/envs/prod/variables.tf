variable "location" {
  description = "Azure region for LaunchMyWork resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the LaunchMyWork resource group."
  type        = string
}

variable "acr_name" {
  description = "Globally unique Azure Container Registry name."
  type        = string
}

variable "key_vault_name" {
  description = "Globally unique Azure Key Vault name."
  type        = string
}

variable "workload_identity_name" {
  description = "Name of the user-assigned managed identity used by AKS workloads."
  type        = string
}

variable "aks_name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "node_vm_size" {
  description = "VM size for the AKS system node pool."
  type        = string
}

variable "min_count" {
  description = "Minimum node count for the AKS system node pool."
  type        = number
}

variable "max_count" {
  description = "Maximum node count for the AKS system node pool."
  type        = number
}

variable "tags" {
  description = "Common tags applied to LaunchMyWork resources."
  type        = map(string)
  default     = {}
}

variable "acr_sku" {
  description = "ACR SKU."
  type        = string
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Whether ACR admin user is enabled. Keep false for identity-based access."
  type        = bool
  default     = false
}

variable "key_vault_sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"
}

variable "key_vault_soft_delete_retention_days" {
  description = "Number of days to retain deleted Key Vault objects."
  type        = number
  default     = 7
}

variable "key_vault_rbac_authorization_enabled" {
  description = "Whether Key Vault uses Azure RBAC authorization."
  type        = bool
  default     = true
}

variable "key_vault_purge_protection_enabled" {
  description = "Whether purge protection is enabled for Key Vault."
  type        = bool
  default     = false
}

variable "key_vault_public_network_access_enabled" {
  description = "Whether public network access is enabled for Key Vault."
  type        = bool
  default     = true
}

variable "workload_identity_key_vault_role_definition_name" {
  description = "Azure role assigned to the workload managed identity for Key Vault access."
  type        = string
  default     = "Key Vault Secrets User"
}

variable "aks_sku_tier" {
  description = "AKS pricing tier."
  type        = string
  default     = "Free"
}

variable "aks_oidc_issuer_enabled" {
  description = "Whether the AKS OIDC issuer is enabled."
  type        = bool
  default     = true
}

variable "aks_workload_identity_enabled" {
  description = "Whether AKS Workload Identity is enabled."
  type        = bool
  default     = true
}

variable "aks_node_pool_name" {
  description = "Name of the default AKS node pool."
  type        = string
  default     = "system"
}

variable "aks_auto_scaling_enabled" {
  description = "Whether autoscaling is enabled for the default AKS node pool."
  type        = bool
  default     = true
}

variable "aks_os_disk_size_gb" {
  description = "OS disk size in GB for AKS nodes."
  type        = number
  default     = 32
}

variable "aks_node_pool_max_surge" {
  description = "Maximum surge setting used during AKS node pool upgrades."
  type        = string
  default     = "10%"
}

variable "aks_identity_type" {
  description = "Identity type used by the AKS cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "aks_network_plugin" {
  description = "Network plugin used by AKS."
  type        = string
  default     = "azure"
}

variable "aks_network_plugin_mode" {
  description = "Network plugin mode used by AKS."
  type        = string
  default     = "overlay"
}

# In the AzureRM provider version you are using, network_policy = "none" is not accepted. To have no network policy, we should omit the network_policy argument instead of setting it to "none".
variable "aks_network_policy" {
  description = "Network policy engine used by AKS."
  type        = string
  default     = null
}

variable "aks_load_balancer_sku" {
  description = "Load balancer SKU used by AKS."
  type        = string
  default     = "standard"
}

variable "aks_outbound_type" {
  description = "Outbound routing method for AKS nodes."
  type        = string
  default     = "loadBalancer"
}

variable "aks_pod_cidr" {
  description = "CIDR range for AKS pods when using overlay networking."
  type        = string
  default     = "10.244.0.0/16"
}

variable "aks_service_cidr" {
  description = "CIDR range for Kubernetes services."
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "IP address for the Kubernetes DNS service."
  type        = string
  default     = "10.0.0.10"
}

variable "aks_key_vault_secret_rotation_enabled" {
  description = "Whether secret rotation is enabled for the Key Vault Secrets Provider add-on."
  type        = bool
  default     = true
}

variable "aks_key_vault_secret_rotation_interval" {
  description = "Secret rotation interval for the Key Vault Secrets Provider add-on."
  type        = string
  default     = "2m"
}

variable "aks_acr_pull_role_definition_name" {
  description = "Azure role assigned to the AKS kubelet identity so it can pull images from ACR."
  type        = string
  default     = "AcrPull"
}