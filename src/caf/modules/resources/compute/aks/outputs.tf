output "aks_cluster" {
  value = {
    id = azurerm_kubernetes_cluster.aks.id
    name = azurerm_kubernetes_cluster.aks.name
    default_node_pool = azurerm_kubernetes_cluster.aks.default_node_pool
  }
  depends_on = [ azurerm_kubernetes_cluster.aks ]
}
