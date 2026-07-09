# Terraform outputs can reference any exported attribute from the resource
# this output.tf is to show and verify the values are being passed to the module correctly. 
# "module" in this case is the resource group module. 

output "name" {
  description = "Resource group name"
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Resource group location"
  value       = azurerm_resource_group.this.location
}

# although id is not specifically specified within main.tf, it is a property of the azurerm_resource_group resource.
output "id" {
  description = "Resource group id"
  value       = azurerm_resource_group.this.id
}