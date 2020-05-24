# terraform-aks

This is a module for deploying Azure Kubernetes Service with Terraform.

## Variables

| Variable Name                 | Description                                                               | Default Value                 |
|-------------------------------|---------------------------------------------------------------------------|-------------------------------|
| clusterName                   | The name of the AKS cluster to be deployed.                               | None                          |
| clusterResourceGroupName      | The name of the resource group where the cluster will be deployed.        | None                          |
| vmSize                        | The size of the nodes for the default node pool.                          | None                          |
| nodeCount                     | The count of nodes for the default node pool.                             | None                          |
| location                      | The name of the Azure region where the cluster will be deployed.          | None                          |

## Examples

Examples of how to use the module are in the `examples` directory of the repository.