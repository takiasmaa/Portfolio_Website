# "this" is the resource group that will be created by this module. "this" name is terraform name not azure resource group name. The azure resource group name is defined by the variable "name" which is passed to this module.
resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags
}
