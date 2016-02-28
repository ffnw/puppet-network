define network::inet::loopback::down (
  String $cmd,
) {

  include network::inet::loopback

  network::loopback_event { "inet_down_${title}":
    family => 'inet',
    event  => 'down',
    cmd    => $cmd,
  }

}

