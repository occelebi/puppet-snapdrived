# == Class: snapdrive
#
# Netapp Snapdrive
#
#  class { snapdrive:
#  }
#
# === Authors
#
# Onur Cem Celebi <onur_cem.celebi@baloise.com>
#
# === Copyright
#
# Copyright 2016 Basler Versicherung
#
class snapdrive (
  $audit_log_file                     = undef,
  $trace_log_file                     = undef,
  $recovery_log_file                  = undef,
  $client_trace_log_file              = undef,
  $daemon_trace_log_file              = undef,
  $ping_interfaces_with_same_octet    = undef,
  $check_export_permission_nfs_clone  = undef,
  $snapcreate_check_nonpersistent_nfs = undef,
){

  anchor { 'snapdrive::begin': } ->
  class { '::snapdrive::install': } ->
  class { '::snapdrive::config': } ~>
  class { '::snapdrive::service': } ->
  anchor { 'snapdrive::end': }
}
