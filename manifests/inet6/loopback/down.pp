define network::inet6::loopback::down (
  String $cmd,
) {

  network::loopback_event { "inet6_down_${title}":
    event => 'down',
    cmd   => $cmd,
  }

}

