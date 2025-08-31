resource "azurerm_storage_account" "st_accs" {
  name                     = var.stg_name
  location                 = var.location
  resource_group_name      = var.rg_name
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.tags

}
