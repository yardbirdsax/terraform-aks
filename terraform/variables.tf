variable "clusterName" {
  type = string
  description = "The name of the AKS cluster to be created."
}

variable "clusterResourceGroupName" {
  type = string
  description = "The name of the resource group where the cluster resides."
}

variable "vmSize" {
  type = string
  description = "The size of the worker node VMs."
  default = "Standard_B2ms"
}

variable nodeCount {
  type = number
  description = "The number of nodes to deploy."
  default = 1
}

variable "location" {
  type = string
  description = "The Azure region where the resources will be deployed."
}




