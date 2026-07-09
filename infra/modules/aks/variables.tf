variable "name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where AKS will be created."
  type        = string
}

variable "location" {
  description = "Azure region where AKS will be created."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "sku_tier" {
  description = "AKS pricing tier. Free is cost-effective for this project."
  type        = string
  default     = "Free"
}

variable "oidc_issuer_enabled" {
  description = "Whether the AKS OIDC issuer is enabled. Required for AKS Workload Identity."
  type        = bool
  default     = true
}

variable "workload_identity_enabled" {
  description = "Whether AKS Workload Identity is enabled."
  type        = bool
  default     = true
}

variable "node_pool_name" {
  description = "Name of the default AKS node pool. Must be 12 characters or fewer."
  type        = string
  default     = "system"

  validation {
    condition     = length(var.node_pool_name) <= 12
    error_message = "AKS node pool name must be 12 characters or fewer."
  }
}

variable "node_vm_size" {
  description = "VM size for the AKS system node pool."
  type        = string
  default     = "Standard_D2as_v5"
}

variable "auto_scaling_enabled" {
  description = "Whether autoscaling is enabled for the default node pool."
  type        = bool
  default     = true
}

variable "min_count" {
  description = "Minimum number of nodes for the system node pool."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes for the system node pool."
  type        = number
  default     = 2

  validation {
    condition     = var.max_count >= var.min_count
    error_message = "max_count must be greater than or equal to min_count."
  }
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB for AKS nodes."
  type        = number
  default     = 32
}

variable "node_pool_max_surge" {
  description = "Maximum surge setting used during AKS node pool upgrades."
  type        = string
  default     = "10%"
}

variable "identity_type" {
  description = "Identity type used by the AKS cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "network_plugin" {
  description = "Network plugin used by AKS."
  type        = string
  default     = "azure"
}

variable "network_plugin_mode" {
  description = "Network plugin mode. Overlay is used for Azure CNI Overlay."
  type        = string
  default     = "overlay"
}

# In the AzureRM provider version you are using, network_policy = "none" is not accepted. To have no network policy, we should omit the network_policy argument instead of setting it to "none".
variable "network_policy" {
  description = "Network policy engine used by AKS."
  type        = string
  default     = null
}

variable "load_balancer_sku" {
  description = "Load balancer SKU used by AKS."
  type        = string
  default     = "standard"
}

variable "outbound_type" {
  description = "Outbound routing method for AKS nodes."
  type        = string
  default     = "loadBalancer"
}

variable "pod_cidr" {
  description = "CIDR range for AKS pods when using overlay networking."
  type        = string
  default     = "10.244.0.0/16"
}

variable "service_cidr" {
  description = "CIDR range for Kubernetes services."
  type        = string
  default     = "10.0.0.0/16"
}

variable "dns_service_ip" {
  description = "IP address for the Kubernetes DNS service."
  type        = string
  default     = "10.0.0.10"
}

variable "key_vault_secret_rotation_enabled" {
  description = "Whether secret rotation is enabled for the Key Vault Secrets Provider add-on."
  type        = bool
  default     = true
}

variable "key_vault_secret_rotation_interval" {
  description = "Secret rotation interval for the Key Vault Secrets Provider add-on."
  type        = string
  default     = "2m"
}

variable "acr_id" {
  description = "Azure Container Registry resource ID used for AcrPull role assignment."
  type        = string
}

variable "acr_pull_role_definition_name" {
  description = "Azure role assigned to the AKS kubelet identity so it can pull images from ACR."
  type        = string
  default     = "AcrPull"
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}