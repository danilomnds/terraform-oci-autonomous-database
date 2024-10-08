resource "oci_database_autonomous_database" "autonomous_database" {
  admin_password                       = var.admin_password
  are_primary_whitelisted_ips_used     = var.are_primary_whitelisted_ips_used
  auto_refresh_frequency_in_seconds    = var.auto_refresh_frequency_in_seconds
  auto_refresh_point_lag_in_seconds    = var.auto_refresh_point_lag_in_seconds
  autonomous_container_database_id     = var.autonomous_container_database_id
  autonomous_database_backup_id        = var.autonomous_database_backup_id
  autonomous_database_id               = var.autonomous_database_id
  autonomous_maintenance_schedule_type = var.autonomous_maintenance_schedule_type
  backup_retention_period_in_days      = var.backup_retention_period_in_days
  character_set                        = var.character_set
  clone_type                           = var.clone_type
  compartment_id                       = var.compartment_id
  compute_count                        = var.compute_count
  compute_model                        = var.compute_model
  cpu_core_count                       = var.cpu_core_count
  dynamic "customer_contacts" {
    for_each = var.customer_contacts
    content {
      email = customer_contacts.value.email
    }
  }
  data_safe_status         = var.data_safe_status
  data_storage_size_in_gb  = var.data_storage_size_in_gb
  data_storage_size_in_tbs = var.data_storage_size_in_tbs
  database_edition         = var.database_edition
  db_name                  = var.db_name
  dynamic "db_tools_details" {
    for_each = var.db_tools_details != null ? var.db_tools_details : []
    content {
      compute_count            = lookup(db_tools_details.value, "compute_count", null)
      is_enabled               = lookup(db_tools_details.value, "is_enabled", null)
      max_idle_time_in_minutes = lookup(db_tools_details.value, "max_idle_time_in_minutes", null)
      name                     = db_tools_details.value.name
    }
  }
  db_version                                     = var.db_version
  db_workload                                    = var.db_workload
  defined_tags                                   = local.defined_tags
  disaster_recovery_type                         = var.disaster_recovery_type
  display_name                                   = var.display_name
  freeform_tags                                  = var.freeform_tags
  in_memory_percentage                           = var.in_memory_percentage
  is_access_control_enabled                      = var.is_access_control_enabled
  is_auto_scaling_enabled                        = var.is_auto_scaling_enabled
  is_auto_scaling_for_storage_enabled            = var.is_auto_scaling_for_storage_enabled
  is_dedicated                                   = var.is_dedicated
  is_dev_tier                                    = var.is_dev_tier
  is_free_tier                                   = var.is_free_tier
  is_local_data_guard_enabled                    = var.is_local_data_guard_enabled
  is_mtls_connection_required                    = var.is_mtls_connection_required
  is_preview_version_with_service_terms_accepted = var.is_preview_version_with_service_terms_accepted
  kms_key_id                                     = var.kms_key_id
  license_model                                  = var.license_model
  max_cpu_core_count                             = var.max_cpu_core_count
  ncharacter_set                                 = var.ncharacter_set
  nsg_ids                                        = var.nsg_ids
  is_refreshable_clone                           = var.is_refreshable_clone
  #is_remote_data_guard_enabled = var.is_remote_data_guard_enabled
  ocpu_count                    = var.ocpu_count
  operations_insights_status    = var.operations_insights_status
  private_endpoint_label        = var.private_endpoint_label
  refreshable_mode              = var.refreshable_mode
  remote_disaster_recovery_type = var.remote_disaster_recovery_type
  resource_pool_leader_id       = var.resource_pool_leader_id
  dynamic "resource_pool_summary" {
    for_each = var.db_tools_details != null ? [var.db_tools_details] : []
    content {
      is_disabled = lookup(db_tools_details.value, "is_disabled", null)
      pool_size   = lookup(db_tools_details.value, "pool_size", null)
    }
  }
  dynamic "scheduled_operations" {
    for_each = var.scheduled_operations != null ? [var.scheduled_operations] : []
    content {
      dynamic "day_of_week" {
        for_each = scheduled_operations.value.day_of_week != null ? [scheduled_operations.value.day_of_week] : []
        content {
          name = day_of_week.value.name
        }
      }
      scheduled_start_time = lookup(scheduled_operations.value, "scheduled_start_time", null)
      scheduled_stop_time  = lookup(scheduled_operations.value, "scheduled_stop_time", null)
    }
  }
  secret_id                              = var.secret_id
  secret_version_number                  = var.secret_version_number
  source                                 = var.adbsource
  source_id                              = var.source_id
  standby_whitelisted_ips                = var.standby_whitelisted_ips
  subnet_id                              = var.subnet_id
  subscription_id                        = var.subscription_id
  timestamp                              = var.timestamp
  use_latest_available_backup_time_stamp = var.use_latest_available_backup_time_stamp
  vault_id                               = var.vault_id
  whitelisted_ips                        = var.whitelisted_ips
  switchover_to                          = var.switchover_to
  switchover_to_remote_peer_id           = var.switchover_to_remote_peer_id
  rotate_key_trigger                     = var.rotate_key_trigger
  #is_shrink_only                         = var.is_shrink_only
  lifecycle {
    ignore_changes = [
      defined_tags["IT.create_date"]
    ]
  }
  timeouts {
    create = "12h"
    delete = "6h"
  }
}

resource "oci_identity_policy" "autonomous_database_policy" {
  #if you are deploying the resource outside your home region uncomment the line below
  #provider   = oci.oci-gru
  depends_on = [oci_database_autonomous_database.autonomous_database]
  for_each = {
    for group in var.groups : group => group
    if var.groups != [] && var.compartment != null
  }
  compartment_id = var.compartment_id
  name           = "policy_${var.display_name}"
  description    = "allow one or more groups to read the autonomous database"
  statements = [
    "Allow group ${each.value} to read autonomous-databases in compartment ${var.compartment}"
  ]
}