variable "name" {
  description = "Name of the user-assigned managed identity."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the managed identity will b e created"
  type        = string
}

variable "location" {
  description = "Azure region where the managed identity will be created."
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

