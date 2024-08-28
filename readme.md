# Module - Oracle Autonomous Database
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![OCI](https://img.shields.io/badge/provider-OCI-red)](https://registry.terraform.io/providers/oracle/oci/latest)

Module developed to standardize the creation of Oracle Autonomous Database.

## Compatibility Matrix

| Module Version | Terraform Version | OCI Version     |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.9.5            | 6.8.0           |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Default use case
```hcl
module "adb-<region>-<env>-<system>-<id>" {    
  source = "git::https://github.com/danilomnds/terraform-oci-autonomous-database?ref=v1.0.0"
  compartment_id = <compartment id>
  admin_password = "Password"
  db_name = <db name>  
  display_name = "adb-vcp-prd-coe-001"
  autonomous_container_database_id = <autonomous container database id>
  character_set = "AL32UTF8"
  compute_model = "ECPU"
  cpu_core_count = 4
  data_storage_size_in_gb = 250
  database_edition = "ENTERPRISE_EDITION"
  db_version = "19c"
  db_workload = "AJD" # options are OLTP/DW/AJD/APEX
  is_dedicated = true #if exadata dedicated infrastructure is being used
  ncharacter_set = "AL16UTF16"
  subnet_id = <snet id>
  defined_tags = {
    "IT.area":"infrastructure"
    "IT.department":"ti"    
  }
}
output "autonomous-database-name" {
  value = module.adb-<region>-<env>-<system>-<id>.display_name
}
output "autonomous-database-id" {
  value = module.adb-<region>-<env>-<system>-<id>.id
}
```

## Default use case plus RBAC
```hcl
module "adb-<region>-<env>-<system>-<id>" {    
  source = "git::https://github.com/danilomnds/terraform-oci-autonomous-database?ref=v1.0.0"
  compartment_id = <compartment id>
  admin_password = "Password"
  db_name = <db name>  
  display_name = "adb-vcp-prd-coe-001"
  autonomous_container_database_id = <autonomous container database id>
  character_set = "AL32UTF8"
  compute_model = "ECPU"
  cpu_core_count = 4
  data_storage_size_in_gb = 250
  database_edition = "ENTERPRISE_EDITION"
  db_version = "19c"
  db_workload = "AJD" # options are OLTP/DW/AJD/APEX
  is_dedicated = true #if exadata dedicated infrastructure is being used
  ncharacter_set = "AL16UTF16"
  subnet_id = <snet id>
  defined_tags = {
    "IT.area":"infrastructure"
    "IT.department":"ti"    
  }
  compartment = <compartment name>
  # GRP_OCI_APP-ENV is the Azure AD group that you are going to grant the permissions
  groups = ["OracleIdentityCloudService/GRP_OCI_APP-ENV", "group name 2"]
}
output "autonomous-database-name" {
  value = module.adb-<region>-<env>-<system>-<id>.display_name
}
output "autonomous-database-id" {
  value = module.adb-<region>-<env>-<system>-<id>.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin_password | The password must be between 12 and 30 characters long, and must contain at least 1 uppercase, 1 lowercase, and 1 numeric character. It cannot contain the double quote symbol (") or the username "admin", regardless of casing | `sensitive(string)` | n/a | No |
| are_primary_whitelisted_ips_used | This field will be null if the Autonomous Database is not Data Guard enabled or Access Control is disabled | `bool` | n/a | No |
| auto_refresh_frequency_in_seconds | The frequency a refreshable clone is refreshed after auto-refresh is enabled. The minimum is 1 hour | `number` | n/a | No |
| auto_refresh_point_lag_in_seconds | The time, in seconds, the data of the refreshable clone lags the primary database at the point of refresh | `number` | n/a | No |
| autonomous_container_database_id | The Autonomous Container Database OCID | `string` | n/a | No |
| autonomous_database_backup_id | The OCID of the source Autonomous Database Backup that you will clone to create a new Autonomous Database | `string` | n/a | No |
| autonomous_database_id | The OCID of the source Autonomous Database that you will clone to create a new Autonomous Database | `string` | n/a | No |
| autonomous_maintenance_schedule_type | The maintenance schedule type of the Autonomous Database Serverless instances | `string` | n/a | No |
| backup_retention_period_in_days | Retention period, in days, for backups | `number` | n/a | No |
| character_set | The character set for the autonomous database | `string` | `AL32UTF8` | No |
| clone_type | The Autonomous Database clone type | `string` | n/a | No |
| compartment_id | the ocid of the compartment | `string` | n/a | `Yes` |
| compute_count | The compute amount available to the database | `number` | n/a | No |
| compute_model | The compute model of the Autonomous Database | `string` | n/a | No |
| cpu_core_count | The number of CPU cores to be made available to the database | `number` | n/a | No |
| customer_contacts | the email address used by oracle to send notifications regarding databases and infrastructure | `list(object{})` | `DLs UNIX, Database e Cloud Resources` | No |
| data_safe_status | Status of the Data Safe registration for this Autonomous Database | `string` | n/a | No |
| data_storage_size_in_gb | The size, in gigabytes, of the data volume that will be created and attached to the database | `number` | n/a | No |
| data_storage_size_in_tbs | The size, in terabytes, of the data volume that will be created and attached to the database | `string` | n/a | No |
| database_edition | The Oracle Database Edition that applies to the Autonomous databases | `string` | `ENTERPRISE_EDITION` | No |
| db_name | The database name | `string` | n/a | No |
| db_tools_details | The list of database tools details | `list(object({}))` | n/a | No |
| db_version | A valid Oracle Database version for Autonomous Database | `string` | n/a | No |
| db_workload | The Autonomous Database workload type | `string` | n/a | No |
| defined_tags | Defined tags for this resource | `map(string)` | n/a | No |
| disaster_recovery_type | Indicates the disaster recovery (DR) type of the standby Autonomous Database Serverless instance | `string` | n/a | No |
| display_name | the user-friendly name for the cloud exadata infrastructure | `string` | n/a | `Yes` |
| freeform_tags | Free-form tags for this resource | `map(string)` | n/a | No |
| in_memory_percentage | The percentage of the System Global Area(SGA) assigned to In-Memory tables in Autonomous Database | `string` | n/a | No |
| is_access_control_enabled | Indicates if the database-level access control is enabled. If disabled, database access is defined by the network security rules | `bool` | n/a | No |
| is_auto_scaling_enabled | Indicates if auto scaling is enabled for the Autonomous Database CPU core count | `bool` | `true` | No |
| is_auto_scaling_for_storage_enabled | Indicates if auto scaling is enabled for the Autonomous Database storage | `bool` | `false` | No |
| is_dedicated | True if the database is on dedicated Exadata infrastructure | `bool` | n/a | No |
| is_dev_tier | Autonomous Database for Developers are fixed-shape Autonomous Databases that developers can use to build and test new applications | `bool` | n/a | No |
| is_free_tier |  Indicates if this is an Always Free resource | `bool` | n/a | No |
| is_local_data_guard_enabled | Indicates whether the Autonomous Database has local (in-region) Data Guard enabled | `bool` | n/a | No |
| is_mtls_connection_required | Indicates whether the Autonomous Database requires mTLS connections | `bool` | n/a | No |
| is_preview_version_with_service_terms_accepted | If set to TRUE, indicates that an Autonomous Database preview version is being provisioned, and that the preview version's terms of service have been accepted | `bool` | n/a | No |
| kms_key_id | The OCID of the key container that is used as the master encryption key in database transparent data encryption (TDE) operations | `string` | n/a | No |
| license_model | The Oracle license model that applies to the Oracle Autonomous Database. Bring your own license (BYOL) allows you to apply your current on-premises Oracle software licenses to equivalent, highly automated Oracle services in the cloud | `string` | `BRING_YOUR_OWN_LICENSE` | No |
| ncharacter_set | The character set for the Autonomous Database | `string` | `AL16UTF16 ` | No |
| nsg_ids |  The list of OCIDs for the network security groups (NSGs) to which this resource belongs | `list(string)` | n/a | No |
| is_refreshable_clone | True for creating a refreshable clone and False for detaching the clone from source Autonomous Database | `bool` | n/a | No |
| is_remote_data_guard_enabled | Indicates whether the Autonomous Database has Cross Region Data Guard enabled | `bool` | n/a | No |
| ocpu_count | The number of OCPU cores to be made available to the database | `number` | n/a | No |
| operations_insights_status | Status of Operations Insights for this Autonomous Database | `string` | n/a | No |
| private_endpoint_label | The resource's private endpoint label | `string` | n/a | No |
| refreshable_mode | The refresh mode of the clone | `string` | n/a | No |
| remote_disaster_recovery_type | Indicates the cross-region disaster recovery (DR) type of the standby Autonomous Database Serverless instance | `string` | n/a | No |
| resource_pool_leader_id | The unique identifier for leader autonomous database OCID OCID | `string` | n/a | No |
| resource_pool_summary | The configuration details for resource pool | `object({})` | n/a | No |
| scheduled_operations | The list of scheduled operation | `object({})` | n/a | No |
| secret_id | The Oracle Cloud Infrastructure vault secret [/Content/General/Concepts/identifiers.htm]OCID | `string` | n/a | No |
| secret_version_number | The version of the vault secret. If no version is specified, the latest version will be used | `string` | n/a | No |
| adbsource | The source of the database | `string` | n/a | No |
| source_id | The OCID of the source Autonomous Database that will be used to create a new standby database for the Data Guard association | `string` | n/a | No |
| standby_whitelisted_ips | The client IP access control list (ACL). This feature is available for Autonomous Database Serverless and on Exadata Cloud@Customer | `list(string)` | n/a | No |
| subnet_id | The OCID of the subnet the resource is associated with | `string` | n/a | No |
| subscription_id | The OCID of the subscription with which resource needs to be associated with | `string` | n/a | No |
| timestamp | The timestamp specified for the point-in-time clone of the source Autonomous Database | `string` | n/a | No |
| use_latest_available_backup_time_stamp | Clone from latest available backup timestamp | `string` | n/a | No |
| vault_id | The OCID of the Oracle Cloud Infrastructure vault | `string` | n/a | No |
| whitelisted_ips | The client IP access control list (ACL) | `list(string)` | n/a | No |
| switchover_to |  It is applicable only when is_local_data_guard_enabled is true | `string` | n/a | No |
| switchover_to_remote_peer_id | It is applicable only when dataguard_region_type and role are set, and is_dedicated is false | `string` | n/a | No |
| rotate_key_trigger | An optional property when flipped triggers rotation of KMS key. It is only applicable on dedicated databases i.e. where is_dedicated is true | `string` | n/a | No |
| is_shrink_only | An optional property when enabled triggers the Shrinking of Autonomous Database once | `bool` | n/a | No |
| groups | list of azure AD groups that will manage objects inside the bucket | `list(string)` | n/a | No |
| compartment | compartment name that will be used for policy creation | `string` | n/a | No |
| enable_group_access | enables the policy creation. If true the groups var should have a least one value | `bool` | `true` | No |

# Object variables for blocks

Please check the documentation [here](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/database_autonomous_database)

## Output variables

| Name | Description |
|------|-------------|
| display_name | autonomous database name|
| id | autonomous autonomous database id |

## Documentation
Oracle Autonomous Database: <br>
[https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/database_autonomous_database](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/database_autonomous_database)