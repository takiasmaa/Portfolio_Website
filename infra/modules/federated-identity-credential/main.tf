resource "azurerm_federated_identity_credential" "this" {
  name                     = var.name
  user_assigned_identity_id = var.user_assigned_identity_id
  issuer                   = var.issuer
  subject                  = var.subject
  audience                 = var.audience
}