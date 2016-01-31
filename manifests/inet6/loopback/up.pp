define network::inet6::loopback::up (
  String $cmd,
) {

  network::loopback_event { "inet6_up_${title}":
    event => 'up',
    cmd   => $cmd,
  }

}

