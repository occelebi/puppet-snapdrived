class snapdrive::config {
  file { '/opt/NetApp/snapdrive/snapdrive.conf':
    content => template('snapdrive/snapdrive.conf.erb'),
    mode    => '0444',
  }
}
