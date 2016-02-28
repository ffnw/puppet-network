define network::inet6::loopback::up (
  String $cmd,
) {

  include network::inet6::loopback

  network::loopback_event { "inet6_up_${title}":
    family => 'inet6',
    event  => 'up',
    cmd    => $cmd,
  }

}

