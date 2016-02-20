define network::inet6::loopback::up (
  String $cmd,
) {

  require network::inet6::loopback

  network::loopback_event { "inet6_up_${title}":
    event => 'up',
    cmd   => $cmd,
  }

}

