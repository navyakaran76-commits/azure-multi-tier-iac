resource "azurerm_app_service_plan" "asp" {
  name                = "myAppServicePlan"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = {
    environment = var.environment
    project     = "multi-tier-app"
  }
}

resource "azurerm_app_service" "app" {
  name                = "myWebApp"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    always_on        = true
    http2_enabled    = true
    linux_fx_version = "DOTNETCORE|6.0"   # Example for Linux WebApp
  }

  https_only = true

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
    project     = "multi-tier-app"
  }
}
