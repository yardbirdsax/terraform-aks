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

variable subnet_id {
  type = string
  description = "The ID of the subnet in which nodes will be placed."
  default = null
}

variable service_cidr {
  type = string
  description = "The CIDR range to use for the service network."
  default = "10.0.0.0/16"
}

variable pod_cidr {
  type = string
  description = "The CIDR range to use for the pod network."
  default = "10.244.0.0/16"
}

variable docker_bridge_cidr {
  type = string
  description = "The CIDR range to use for the docker bridge network."
  default = "172.17.0.1/16"
}

variable dns_service_ip {
  type = string
  description = "The IP to use for the DNS service."
  default = "10.0.0.10"
}

variable network_plugin {
  type = string
  description = "The name of the network plugin to use."
  default = "kubenet"
}




