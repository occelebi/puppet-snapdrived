class snapdrived::config {
  file { '/opt/NetApp/snapdrive/snapdrive.conf':
    content => template('snapdrived/snapdrive.conf.erb'),
    mode    => '0644',
  }
}
