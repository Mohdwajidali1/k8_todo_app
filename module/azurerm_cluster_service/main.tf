resource "azurerm_kubernetes_cluster" "k8_clusters" {
  name                = var.kc_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}