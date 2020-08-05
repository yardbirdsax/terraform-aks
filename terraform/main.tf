resource random_password spPassword {
    length = 64
}

resource "azuread_application" "aksApp" {
    name = var.clusterName
}

resource "azuread_service_principal" "aksSp" {
    application_id = azuread_application.aksApp.application_id
}

resource "azuread_service_principal_password" "aksSpPassword" {
    service_principal_id = azuread_service_principal.aksSp.id
    value = random_password.spPassword.result
    # 100 years
    end_date_relative = "876000h"
}

resource "azurerm_kubernetes_cluster" "aksCluster" {
    name = var.clusterName 
    resource_group_name = var.clusterResourceGroupName
    location = var.location
    dns_prefix = var.clusterName
    
    default_node_pool {
        name = "default"
        node_count = var.nodeCount
        vm_size = var.vmSize
        type = "VirtualMachineScaleSets"
        vnet_subnet_id = var.subnet_id
    }

    service_principal {
        client_id = azuread_application.aksApp.application_id
        client_secret = random_password.spPassword.result
    }

    depends_on = [
        azuread_service_principal_password.aksSpPassword
    ]

    network_profile {
        service_cidr = var.service_cidr
        network_plugin = var.network_plugin
    }
}

