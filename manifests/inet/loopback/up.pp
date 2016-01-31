define network::inet::loopback::up (
  String $cmd,
) {

  network::loopback_event { "inet_up_${title}":
    event => 'up',
    cmd   => $cmd,
  }

}

