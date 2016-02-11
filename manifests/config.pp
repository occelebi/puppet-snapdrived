class snapdrived::config {
  file { '/opt/NetApp/snapdrived/snapdrive.conf':
    content => template('snapdrived/snapdrive.conf.erb'),
    mode    => '0644',
  }
}
