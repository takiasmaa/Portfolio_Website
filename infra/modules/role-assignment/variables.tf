variable "scope" {
  description = "Azure resource ID where the role assignment applies."
  type        = string
}

variable "role_definition_name" {
  description = "Name of the Azure built-in role to assign to the managed identity."
  type        = string
}

variable "principal_id" {
  description = "Object ID/principal ID of the identity receiving the role assignment."
  type        = string
}
