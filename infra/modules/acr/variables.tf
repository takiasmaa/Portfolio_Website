variable "name" {
  description = "Globally unique Azure Container Registry name. Lowercase letters and numbers only."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where ACR will be located"
  type        = string
}

variable "location" {
  description = "Azure region where ACR will be created"
  type        = string
}

variable "sku" {
  description = "ACR SKU. Basic is the most cost-effective option for this project."
  type        = string
  default     = "Basic"
}

# We are keeping admin_enabled = false because we want AKS and GitHub Actions to access ACR through identity/RBAC, not shared username/password credentials.
variable "admin_enabled" {
  description = "Whether the ACR admin user is enabled. Keep false for better security."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

