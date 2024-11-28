resource "azurerm_mysql_flexible_server" "mysql_flexible_server" {
  name                   = var.project_name
  resource_group_name    = azurerm_resource_group.resource_group.name
  location               = azurerm_resource_group.resource_group.location
  administrator_login    = "login"
  administrator_password = "password"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.private_dns_zone.id
  sku_name               = "B_Standard_B1ms"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link]
}

resource "azurerm_mysql_flexible_database" "mysql_flexible_database" {
  name                = var.project_name
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_mysql_flexible_server.mysql_flexible_server.name
  charset             = "utf8"
  collation           = "utf8_general_ci"

  lifecycle {
    prevent_destroy = true
  }
}
