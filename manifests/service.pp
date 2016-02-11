class snapdrive::service {

  service { 'snapdrived':
    enable    => true,
    ensure    => running,
  }
}
