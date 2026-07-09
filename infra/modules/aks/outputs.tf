output "id" {
  description = "AKS cluster resource ID."
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "AKS cluster name."
  value       = azurerm_kubernetes_cluster.this.name
}

output "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity. Used for ACR pull permissions."
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  # This means give me the first kubelet_identity block
  # kubelet_identity is exposed as a list by the AzureRM provider.
  # AKS normally has one kubelet identity, so [0] selects that identity.
  # example : 12345678-1234-1234-1234-123456789012
}

output "oidc_issuer_url" {
  description = "AKS OIDC issuer URL. Used later for workload identity federation."
  value       = azurerm_kubernetes_cluster.this.oidc_issuer_url
  # example : https://eastus.oic.prod-aks.azure.com/<tenant-id>/<cluster-id>/
}

output "key_vault_secrets_provider_identity_object_id" {
  description = "Object ID of the identity created by the Key Vault Secrets Provider add-on."
  value       = azurerm_kubernetes_cluster.this.key_vault_secrets_provider[0].secret_identity[0].object_id
}

output "kube_config" {
  description = "Raw kubeconfig for the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
  # sensitive = true means that the output will not be displayed in the Terraform plan or apply output, and it will be marked as sensitive in the state file. This is important for security reasons, as kubeconfig contains credentials and access information for the AKS cluster.
}