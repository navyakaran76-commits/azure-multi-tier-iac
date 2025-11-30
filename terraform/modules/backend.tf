terraform {
  backend "azurerm" {
    resource_group_name  = "rg-iac-storage-eastus"
    storage_account_name = "iacterraformstate001"
    container_name       = "tfstate"
    key                  = "network/terraform.tfstate"
  }
}
