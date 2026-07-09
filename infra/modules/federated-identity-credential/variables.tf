variable "name" {
  description = "Name of the federated identity credential."
  type        = string
}

variable "user_assigned_identity_id" {
  description = "Resource ID of the user-assigned managed identity."
  type        = string
}

variable "issuer" {
  description = "AKS OIDC issuer URL."
  type        = string
}

variable "subject" {
  description = "Federated identity subject."
  type        = string
}

variable "audience" {
  description = "Federated identity audience."
  type        = list(string)
  default     = ["api://AzureADTokenExchange"]
}