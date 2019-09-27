variable "resource_group_name" {
	description = "The name of the resource group"
}

variable "tags" {
  description = "Tags of every resources created."
  type        = "map"
}

variable "cluster_name" {
	description = "The name of the cluster"
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
}

variable "location" {
  default     = "eastus"
  description = "The location for the AKS deployment"
}

variable "CLIENT_ID" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
}

variable "CLIENT_SECRET" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "agents_size" {
  default     = "Standard_F2"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  default     = 30
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  default     = 2
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to install"
  default     = "1.14.5"
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster"
  default     = ""
}

variable "enable_http_application_routing" {
  description = "Enable HTTP Application Routing Addon (forces recreation)"
  default     = false
}

variable "enable_role_based_access_control" {
  description = "Enable role based access control (forces recreation)"
  default     = false
}

variable "os_disk_size_gb" {
  description = "The Agent Operating System disk size in GB. Changing this forces a new resource to be created"
  default = 30
}

variable "kubeconfig_path" {
  description = "full path to save the kubeconfig in (e.g. /root/.kube/mycluster.yaml). make sure to add this file to KUBECONFIG (e.g. export KUBECONFIG=$KUBECONFIG:/root/.kube/mycluster.yaml) in order to add it to your list of clusters" 
}

variable "vnet_subnet_id" {
  description = "The ID of the Subnet where the Agents in the Pool should be provisioned. Changing this forces a new resource to be created."
  default = null
}

variable "azure_active_directory" {
  default = null
  type = object({
    client_app_id       = string
    server_app_id       = string
    server_app_secret   = string
    tenant_id           = string
  })
}


