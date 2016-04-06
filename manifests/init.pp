# == Class: snapdrived
#
# Netapp Snapdrived
#
#  class { snapdrived: }
#
# === Authors
#
# Onur Cem Celebi <onur_cem.celebi@baloise.com>
#
# === Copyright
#
# Copyright 2016 Basler Versicherung
#
class snapdrived (
  $package_name                              = 'netapp.snapdrive',
  $package_version                           = 'installed',
  $log_dir                                   = undef,
  $manage_log_dir                            = false,
  $path                                      = undef,
  $all_access_if_rbac_unspecified            = undef,
  $allow_partial_clone_connect               = undef,
  $audit_log_file                            = undef,
  $audit_log_max_size                        = undef,
  $audit_log_save                            = undef,
  $autosupport_enabled                       = undef,
  $available_lun_reserve                     = undef,
  $blacklist_interfaces                      = undef,
  $bypass_snapdrive_clone_generated_check    = undef,
  $check_export_permission_nfs_clone         = undef,
  $client_trace_log_file                     = undef,
  $cluster_operation_timeout_secs            = undef,
  $contact_http_dfm_port                     = undef,
  $contact_http_port                         = undef,
  $contact_http_port_sdu_daemon              = undef,
  $contact_https_port_sdu_daemon             = undef,
  $contact_ssl_dfm_port                      = undef,
  $contact_ssl_port                          = undef,
  $contact_viadmin_port                      = undef,
  $daemon_trace_log_file                     = undef,
  $datamotion_cutover_wait                   = undef,
  $default_noprompt                          = undef,
  $default_transport                         = undef,
  $deferred_logical_volume_start             = undef,
  $device_retries                            = undef,
  $device_retry_sleep_secs                   = undef,
  $dfm_api_timeout                           = undef,
  $dfm_rbac_retries                          = undef,
  $dfm_rbac_retry_sleep_secs                 = undef,
  $do_lunclone                               = undef,
  $enable_alua                               = undef,
  $enable_fcp_cache                          = undef,
  $enable_implicit_host_preparation          = undef,
  $enable_migrate_nfs_version                = undef,
  $enable_mount_with_netdev                  = undef,
  $enable_mountguard_support                 = undef,
  $enable_parallel_operations                = undef,
  $enable_ping_to_check_filer_reachability   = undef,
  $enable_split_clone                        = undef,
  $enforce_strong_ciphers                    = undef,
  $filer_restore_retries                     = undef,
  $filer_restore_retry_sleep_secs            = undef,
  $filesystem_freeze_timeout_secs            = undef,
  $flexclone_writereserve_enabled            = undef,
  $fstype                                    = undef,
  $igroup_file                               = undef,
  $loadsharing_update_sleep_interval         = undef,
  $lun_onlining_in_progress_retries          = undef,
  $lun_onlining_in_progress_sleep_secs       = undef,
  $lunpath_monitor_frequency                 = undef,
  $mgmt_retries                              = undef,
  $mgmt_retry_sleep_long_secs                = undef,
  $mgmt_retry_sleep_secs                     = undef,
  $migrate_file                              = undef,
  $multipathing_type                         = undef,
  $override_vbsr_snapmirror_check            = undef,
  $override_vbsr_snapvault_check             = undef,
  $password_file                             = undef,
  $ping_interfaces_with_same_octet           = undef,
  $portset_file                              = undef,
  $prefix_clone_name                         = undef,
  $prefix_filer_lun                          = undef,
  $prepare_lun_count                         = undef,
  $rbac_cache                                = undef,
  $rbac_cache_timeout                        = undef,
  $rbac_method                               = undef,
  $recovery_log_file                         = undef,
  $recovery_log_save                         = undef,
  $san_clone_method                          = undef,
  $sdu_daemon_certificate_path               = undef,
  $sdu_password_file                         = undef,
  $secure_communication_among_cluster_nodes  = undef,
  $sfsr_polling_frequency                    = undef,
  $snapconnect_nfs_removedirectories         = undef,
  $snapcreate_cg_timeout                     = undef,
  $snapcreate_check_nonpersistent_nfs        = undef,
  $snapcreate_consistency_retries            = undef,
  $snapcreate_consistency_retry_sleep        = undef,
  $snapcreate_must_make_snapinfo_on_qtree    = undef,
  $snapdelete_delete_rollback_with_snap      = undef,
  $snapmirror_dest_snap_support_enabled      = undef,
  $snaprestore_delete_rollback_after_restore = undef,
  $snaprestore_make_rollback                 = undef,
  $snaprestore_must_make_rollback            = undef,
  $snaprestore_snapmirror_check              = undef,
  $space_reservations_enabled                = undef,
  $space_reservations_volume_enabled         = undef,
  $trace_enabled                             = undef,
  $trace_level                               = undef,
  $trace_log_file                            = undef,
  $trace_log_max_size                        = undef,
  $trace_log_save                            = undef,
  $use_efi_label                             = undef,
  $use_https_to_dfm                          = undef,
  $use_https_to_filer                        = undef,
  $use_https_to_sdu_daemon                   = undef,
  $use_https_to_viadmin                      = undef,
  $vif_password_file                         = undef,
  $virtualization_operation_timeout_secs     = undef,
  $vmtype                                    = undef,
  $vol_restore                               = undef,
  $volmove_cutover_retry                     = undef,
  $volmove_cutover_retry_sleep               = undef,
  $volume_clone_retry                        = undef,
  $volume_clone_retry_sleep                  = undef,
  $volume_destroy_retry                      = undef,
  $volume_destroy_retry_sleep                = undef,
  $volume_offline_retry                      = undef,
  $volume_offline_retry_sleep                = undef,
){

  package { $package_name,
    ensure => $package_version,
  }

  # Create log file directory if we specify manage_log_dir
  #
  if ( $manage_log_dir and $log_dir ) {
    file { $log_dir:
      ensure => directory,
      before => Service['snapdrived'],
    }
  }

  file { '/opt/NetApp/snapdrive/snapdrive.conf':
    content => template('snapdrived/snapdrive.conf.erb'),
    mode    => '0644',
    require => Package['netapp.snapdrive'],
  }

  service { 'snapdrived':
    ensure    => running,
    enable    => true,
    subscribe => File['/opt/NetApp/snapdrive/snapdrive.conf'],
  }

  case $::operatingsystem {
    'RedHat': {
      if versioncmp($::operatingsystemmajrelease, 7) >= 0 {

        # Create trigger script for unit file
        file { '/opt/NetApp/snapdrive/bin/env.sh':
          content => template('snapdrived/env.sh'),
          mode    => '0644',
        }

        # Create unit file for systemd based system
        file { '/usr/lib/systemd/system/snapdrived.service':
          content => template('snapdrived/snapdrived.service'),
          mode    => '0644',
        }
      }
    }
    default: {}
  }
}
