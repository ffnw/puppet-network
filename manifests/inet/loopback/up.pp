define network::inet::loopback::up (
  String $cmd = $title,
) {

  include network::inet::loopback

  network::loopback_event { "inet_up_${title}":
    family => 'inet',
    event  => 'up',
    cmd    => $cmd,
  }

}

