output "resource_group_name" {
  description = "LaunchMyWork resource group name."
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "LaunchMyWork resource group ID."
  value       = module.resource_group.id
}

output "acr_name" {
  description = "Azure Container Registry name."
  value       = module.acr.name
}

output "acr_login_server" {
  description = "ACR login server used for Docker image tags."
  value       = module.acr.login_server
}

output "key_vault_name" {
  description = "Key Vault name."
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = module.key_vault.vault_uri
}

output "workload_identity_client_id" {
  description = "Client ID of the workload user-assigned managed identity. Used by AKS Workload Identity."
  value       = module.workload_identity.client_id
}

output "workload_identity_principal_id" {
  description = "Principal ID of the workload user-assigned managed identity. Used for Azure RBAC assignments."
  value       = module.workload_identity.principal_id
}

output "aks_name" {
  description = "AKS cluster name."
  value       = module.aks.name
}

output "aks_oidc_issuer_url" {
  description = "AKS OIDC issuer URL for Workload Identity federation."
  value       = module.aks.oidc_issuer_url
}

output "aks_kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity used for ACR pull access."
  value       = module.aks.kubelet_identity_object_id
}