provider "azurerm" {
  version = "~>2.0.0"
  features {}
}

provider "azuread" {
    version = ">=0.3.1"
}

locals {
  deployment_name = "jef-test-aks"
  location = "eastus2"
}

data azurerm_subscription current { }

resource azurerm_resource_group resourceGroup {
  name = local.deployment_name
  location = local.location
}

module aksCluster {
  # source = "../../terraform"
  # In an actual deployment, you will want to pin this to a tagged version rather than the head of the master branch (though the intent is to keep that the stable version)
  source = "git::https://github.com/yardbirdsax/terraform-aks.git//terraform?ref=heads/master"
  clusterName = local.deployment_name
  clusterResourceGroupName = azurerm_resource_group.resourceGroup.name
  nodeCount = 1
  location = azurerm_resource_group.resourceGroup.location
  
  providers = {
    azurerm = azurerm
    azuread = azuread
  }

}