resource "azurerm_resource_group" "resource_group" {
  location = var.location
  name     = var.project_name
}
