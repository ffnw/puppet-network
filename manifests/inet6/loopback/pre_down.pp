define network::inet6::loopback::pre_down (
  String $cmd = $title,
) {

  include network::inet6::loopback

  network::loopback_event { "inet6_pre-down_${title}":
    family => 'inet6',
    event  => 'pre-down',
    cmd    => $cmd,
  }

}

