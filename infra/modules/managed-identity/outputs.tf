# The Azure resource ID of the managed identity.
output "id" {
  description = "Managed identity resource ID."
  value       = azurerm_user_assigned_identity.this.id
}

output "name" {
  description = "Managed identity name."
  value       = azurerm_user_assigned_identity.this.name
}

# client id is used by AKS Workload Identity annotations to link the managed identity to a Kubernetes service account.
# annotations:
#   azure.workload.identity/client-id: <client_id>
output "client_id" {
  description = "Managed identity client ID. This is used by AKS Workload Identity annotations."
  value       = azurerm_user_assigned_identity.this.client_id
}

# principal_id is used for Azure RBAC role assignments to grant the managed identity access to Azure resources.
# Key Vault Secrets User on kv-launchmywork-prod
output "principal_id" {
  description = "Managed identity principal ID. This is used for Azure role assignments."
  value       = azurerm_user_assigned_identity.this.principal_id
}
