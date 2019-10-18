resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = "${var.resource_group_name}.Resources"
  dns_prefix          = var.prefix
  kubernetes_version  = var.kubernetes_version

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      # remove any new lines using the replace interpolation function
      key_data = replace(var.admin_public_ssh_key, "\n", "")
    }
  }

  agent_pool_profile {
    name            = "nodepool"
    count           = var.agents_count
    vm_size         = var.agents_size
    os_type         = "Linux"
    os_disk_size_gb = var.os_disk_size_gb
	vnet_subnet_id  = var.vnet_subnet_id
  }

  dynamic "agent_pool_profile" {
    for_each = var.alternate_node_pool == null ? [] : var.alternate_node_pool
    content {
      name           = agent_pool_profile.value.name
      count          = agent_pool_profile.value.count
      vm_size        = agent_pool_profile.value.vm_size
      os_type        = agent_pool_profile.value.os_type
      os_disk_size_gb= agent_pool_profile.value.os_disk_size_gb
      vnet_subnet_id = agent_pool_profile.value.vnet_subnet_id
    }
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
	
	http_application_routing {
	  enabled = "${var.enable_http_application_routing}"
	}
  }
  
  role_based_access_control {
    enabled = "${var.enable_role_based_access_control}"
    
    dynamic "azure_active_directory" {
      for_each = var.azure_active_directory == null ? [] : list(var.azure_active_directory)
      content {
        client_app_id = azure_active_directory.value.client_app_id
	server_app_id = azure_active_directory.value.server_app_id 
	server_app_secret = azure_active_directory.value.server_app_secret
	tenant_id = azure_active_directory.value.tenant_id
      }
    }
  }

  tags = var.tags
}

