resource "azurerm_dns_zone" "dns_zone" {
  name                = var.domain_name
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_dns_a_record" "a_record" {
  name                = "@"
  resource_group_name = azurerm_resource_group.resource_group.name
  ttl                 = 0
  zone_name           = azurerm_dns_zone.dns_zone.name
  records = [
    azurerm_container_app_environment.container_app_environment.static_ip_address
  ]
}

resource "azurerm_dns_txt_record" "txt_record" {
  name                = "asuid"
  resource_group_name = azurerm_resource_group.resource_group.name
  ttl                 = 0
  zone_name           = azurerm_dns_zone.dns_zone.name
  record {
    value = azurerm_container_app.container_app.custom_domain_verification_id
  }
}
