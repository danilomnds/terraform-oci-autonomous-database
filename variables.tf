variable "admin_password" {
  type      = string
  default   = null
  sensitive = true
}

variable "are_primary_whitelisted_ips_used" {
  type    = bool
  default = null
}

variable "auto_refresh_frequency_in_seconds" {
  type    = number
  default = null
}

variable "auto_refresh_point_lag_in_seconds" {
  type    = number
  default = null
}

variable "autonomous_container_database_id" {
  type    = string
  default = null
}

variable "autonomous_database_backup_id" {
  type    = string
  default = null
}

variable "autonomous_database_id" {
  type    = string
  default = null
}

variable "autonomous_maintenance_schedule_type" {
  type    = string
  default = null
}

variable "backup_retention_period_in_days" {
  type    = number
  default = null
}

variable "character_set" {
  type    = string
  default = "AL32UTF8"
}

variable "clone_type" {
  type    = string
  default = null
}

variable "compartment_id" {
  type = string
}

variable "compute_count" {
  type    = string
  default = null
}

variable "compute_model" {
  type    = string
  default = null
}

variable "cpu_core_count" {
  type    = number
  default = null
}

variable "customer_contacts" {
  type = list(object({
    email = string
  }))
  default = [
    {
      email = "DL_IT_OPS_Database@timbrasil.com.br"
    },
    {
      email = "DL_IT_OPSSUPPORT-UNIX@timbrasil.com.br"
    },
    {
      email = "DL_CTIO_OPSCLOUDRESOURCESNotify@timbrasil.com.br"
    }
  ]
}

variable "data_safe_status" {
  type    = string
  default = null
}

variable "data_storage_size_in_gb" {
  type    = number
  default = null
}

variable "data_storage_size_in_tbs" {
  type    = number
  default = null
}

variable "database_edition" {
  type    = string
  default = "ENTERPRISE_EDITION"
}

variable "db_name" {
  type    = string
  default = null
}

variable "db_tools_details" {
  type = list(object({
    compute_count            = optional(number)
    is_enabled               = optional(bool)
    max_idle_time_in_minutes = optional(number)
    name                     = string
  }))
  default = null
}

variable "db_version" {
  type    = string
  default = null
}

variable "db_workload" {
  type    = string
  default = null
}

variable "defined_tags" {
  type    = map(string)
  default = null
}

variable "disaster_recovery_type" {
  type    = string
  default = null
}

variable "display_name" {
  type = string
}

variable "freeform_tags" {
  type    = map(string)
  default = null
}

variable "in_memory_percentage" {
  type    = string
  default = null
}

variable "is_access_control_enabled" {
  type    = bool
  default = null
}

variable "is_auto_scaling_enabled" {
  type    = bool
  default = true
}

variable "is_auto_scaling_for_storage_enabled" {
  type    = bool
  default = false
}

variable "is_dedicated" {
  type    = bool
  default = null
}

variable "is_dev_tier" {
  type    = bool
  default = null
}

variable "is_free_tier" {
  type    = bool
  default = null
}

variable "is_local_data_guard_enabled" {
  type    = bool
  default = null
}

variable "is_mtls_connection_required" {
  type    = bool
  default = null
}

variable "is_preview_version_with_service_terms_accepted" {
  type    = bool
  default = null
}

variable "kms_key_id" {
  type    = string
  default = null
}

variable "license_model" {
  type    = string
  default = "BRING_YOUR_OWN_LICENSE"
}

variable "max_cpu_core_count" {
  type    = number
  default = null
}

variable "ncharacter_set" {
  type    = string
  default = "AL16UTF16"
}

variable "nsg_ids" {
  type    = list(string)
  default = null
}

variable "is_refreshable_clone" {
  type    = bool
  default = null
}

variable "is_remote_data_guard_enabled" {
  type    = bool
  default = null
}

variable "ocpu_count" {
  type    = number
  default = null
}

variable "operations_insights_status" {
  type    = string
  default = null
}

variable "private_endpoint_label" {
  type    = string
  default = null
}

variable "refreshable_mode" {
  type    = string
  default = null
}

variable "remote_disaster_recovery_type" {
  type    = string
  default = null
}

variable "resource_pool_leader_id" {
  type    = string
  default = null
}

variable "resource_pool_summary" {
  type = object({
    is_disabled = optional(bool)
    pool_size   = optional(bool)
  })
  default = null
}

variable "scheduled_operations" {
  type = object({
    day_of_week = optional(object({
      name = string
    }))
    scheduled_start_time = optional(number)
    scheduled_stop_time  = optional(bool)
  })
  default = null
}

variable "secret_id" {
  type    = string
  default = null
}

variable "secret_version_number" {
  type    = string
  default = null
}

variable "adbsource" {
  type    = string
  default = null
}

variable "source_id" {
  type    = string
  default = null
}

variable "standby_whitelisted_ips" {
  type    = list(string)
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "timestamp" {
  type    = string
  default = null
}

variable "use_latest_available_backup_time_stamp" {
  type    = string
  default = null
}

variable "vault_id" {
  type    = string
  default = null
}

variable "whitelisted_ips" {
  type    = list(string)
  default = null
}

variable "switchover_to" {
  type    = string
  default = null
}

variable "switchover_to_remote_peer_id" {
  type    = string
  default = null
}

variable "rotate_key_trigger" {
  type    = string
  default = null
}

variable "is_shrink_only" {
  type    = bool
  default = null
}

variable "groups" {
  type    = list(string)
  default = []
}

variable "compartment" {
  type    = string
  default = null
}