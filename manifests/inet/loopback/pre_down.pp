define network::inet::loopback::pre_down (
  String $cmd = $title,
) {

  include network::inet::loopback

  network::loopback_event { "inet_pre-down_${title}":
    family => 'inet',
    event  => 'pre-down',
    cmd    => $cmd,
  }

}

