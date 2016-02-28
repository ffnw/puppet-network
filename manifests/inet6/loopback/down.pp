define network::inet6::loopback::down (
  String $cmd,
) {

  require network::inet6::loopback

  network::loopback_event { "inet6_down_${title}":
    family => 'inet6',
    event  => 'down',
    cmd    => $cmd,
  }

}

