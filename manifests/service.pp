class snapdrived::service {

  service { 'snapdrived':
    enable    => true,
    ensure    => running,
  }
}
