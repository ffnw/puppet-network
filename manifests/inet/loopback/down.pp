define network::inet::loopback::down (
  String $cmd,
) {

  network::loopback_event { "inet_down_${title}":
    event => 'down',
    cmd   => $cmd,
  }

}

