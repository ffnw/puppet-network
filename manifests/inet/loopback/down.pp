define network::inet::loopback::down (
  String $cmd,
) {

  require network::inet::loopback

  network::loopback_event { "inet_down_${title}":
    event => 'down',
    cmd   => $cmd,
  }

}

