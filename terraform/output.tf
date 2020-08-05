output cluster {
  value = azurerm_kubernetes_cluster.aksCluster
}

output service_principal {
  value = azuread_service_principal.aksSp
}