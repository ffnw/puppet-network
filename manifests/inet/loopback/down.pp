define network::inet::loopback::down (
  String $cmd = $title,
) {

  include network::inet::loopback

  network::loopback_event { "inet_down_${title}":
    family => 'inet',
    event  => 'down',
    cmd    => $cmd,
  }

}

