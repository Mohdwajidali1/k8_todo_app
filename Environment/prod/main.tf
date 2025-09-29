module "resource_group_name" {
  source   = "../../module/azurerm_resource_group"
  rg_name  = "rg_prod_todoapp"
  location = "centralindia"
  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"
  }
}


module "azurerm_storage_account" {
  source     = "../../module/azurerm_storage_account"
  stg_name   = "stg_prod_todoapp"
  rg_name    = "rg_prod_todoapp"
  location   = "centralindia"
  depends_on = [module.resource_group_name]
  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"
  }
}

module "azurerm_key_vault" {
  source     = "../../module/azurerm_key_valt"
  key_name   = "key_vault_prod_todoapp"
  rg_name    = "rg_prod_todoapp"
  location   = "centralindia"
  depends_on = [module.resource_group_name]
  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"

  }
}

module "azurerm_container_registry" {
  source     = "../../module/azurerm_container_resistory"
  acr_name   = "acr_prod_todoapp"
  rg_name    = "rg_prod_todoapp"
  location   = "centralindia"
  depends_on = [module.resource_group_name]
  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"
  }

}

module "azurerm_kubernetes_cluster" {
  source     = "../../module/azurerm_cluster_service"
  kc_name    = "kc_prod_todoapp"
  rg_name    = "rg_prod_todoapp"
  location   = "centralindia"
  depends_on = [module.resource_group_name]
  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"
  }

}

module "azurerm_mssql_server" {
  source             = "../../module/azurerm_sql_server"
  sql_server_name    = "todo_sql_server"
  rg_name            = "rg_prod_todoapp"
  location           = "centralindia"
  admin_username     = "Adminuser"
  admin_userpassword = "Admin@123123"
  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"
  }
}

module "azurerm_mssql_database" {
  depends_on = [ module.azurerm_mssql_server ]
  source          = "../../module/azurerm_sql_database" # Sahi path
  db_name         = "todo_db"
  sql_server_name = "todo_sql_server"
  rg_name         = "rg_prod_todoapp"
  location        = "centralindia"
  server_id       = module.azurerm_mssql_server.server_id

  tags = {
    "Manageby"    = "Terraform"
    "Owner"       = "Todoappteam"
    "Environment" = "prod"
  }
}