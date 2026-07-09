variable "name" {
  description = "Name of the Azure key vault. Must be globally unique."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the Key Vault will be created."
  type        = string
}

variable "location" {
  description = "Azure region where the Key Vault will be created."
  type        = string
}

# Why do we need this tenant_id for KV? Because the Key Vault is a security-sensitive resource, and we want to ensure that it is associated with the correct Azure Active Directory (AAD) tenant. The tenant_id is used to specify which AAD tenant the Key Vault belongs to, ensuring that only users and applications from that tenant can access it. This helps maintain security and access control for the Key Vault.
variable "tenant_id" {
  description = "Azure AD tenant ID."
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain a deleted Key Vault objects. This is a security feature that allows for recovery of deleted objects within the specified retention period. The default value is 7 days, which is a common retention period for soft delete functionality."
  type        = number
  default     = 7
}

variable "rbac_authorization_enabled" {
  description = "Use Azure RBAC for Key Vault authorization instead of access policies. When enabled, access to the Key Vault is managed through Azure RBAC roles and assignments, rather than through access policies defined within the Key Vault itself. An example of RBAC would be to assign the 'Key Vault Secrets User' role to a specific user or application, allowing them to read secrets from the Key Vault without needing to manage access policies directly within the Key Vault. Example of access policy would be to create an access policy that grants a specific user or application permission to read secrets from the Key Vault. This would require managing access policies directly within the Key Vault, which can be more complex and less flexible than using Azure RBAC."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault."
  type        = bool
  default     = false
}

# for security, we want to ensure that the Key Vault is not accessible from public networks by default. This variable allows us to control whether public network access is enabled or disabled for the Key Vault. By default, it is set to true, allowing public network access. However, in a production environment, it is recommended to set this variable to false to restrict access to the Key Vault from private networks only, enhancing security and reducing the attack surface.
variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for Key Vault"
  type        = bool
  default     = true
}






