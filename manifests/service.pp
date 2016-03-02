class snapdrived::service {

  service { 'snapdrived':
    ensure => running,
    enable => true,
  }
}
