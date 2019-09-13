variable "log_analytics_workspace_id" {
  description = "The Log Analytics Workspace Id."
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group."
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Virtual Network"
}

variable "cluster_name" {
	description = "The name of the cluster"
}

variable "location" {
  description = "The Azure Region in which to create the Virtual Network"
}

variable "tags" {
  default     = {}
  description = "Any tags that should be present on the Virtual Network resources"
  type        = map(string)
}

variable "admin_username" {
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "admin_public_ssh_key" {
  description = "The SSH key to be used for the username defined in the `admin_username` variable."
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
}

variable "agents_size" {
  description = "The Azure VM Size of the Virtual Machines used in the Agent Pool"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to install"
  default     = "1.11.3"
}

variable "service_principal_client_id" {
  description = "The Client ID of the Service Principal assigned to Kubernetes"
}

variable "service_principal_client_secret" {
  description = "The Client Secret of the Service Principal assigned to Kubernetes"
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

