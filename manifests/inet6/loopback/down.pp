define network::inet6::loopback::down (
  String $cmd = $title,
) {

  include network::inet6::loopback

  network::loopback_event { "inet6_down_${title}":
    family => 'inet6',
    event  => 'down',
    cmd    => $cmd,
  }

}

