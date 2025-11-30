resource "azurerm_sql_server" "sql" {
  name                         = "${var.prefix}-sqlserver"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"

  administrator_login          = var.sql_admin_user
  administrator_login_password = var.sql_admin_password

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
    project     = "multi-tier-app"
  }
}

resource "azurerm_sql_database" "sqldb" {
  name                = "${var.prefix}-db"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql.name
  sku_name            = "S0"

  tags = {
    environment = var.environment
    project     = "multi-tier-app"
  }
}
