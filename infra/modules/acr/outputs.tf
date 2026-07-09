output "id" {
  description = "ACR resource ID"
  value       = azurerm_container_registry.this.id
}

output "name" {
  description = "ACR name"
  value       = azurerm_container_registry.this.name
}

# This isn't in main.tf because it is not a property of the resource, but rather a computed value that is derived from the resource's properties. 
# "login_server" is the fully qualified domain name of the ACR instance, which is used for Docker image tags.
output "login_server" {
  description = "ACR login server used for Docker image tags"
  value       = azurerm_container_registry.this.login_server
}

# for example after getting the FQDN of the login_server like this, we will have the image and tag names as following example: <FQDN name>.azurecr.io/<image>:<tag>