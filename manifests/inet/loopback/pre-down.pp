define network::inet::loopback::pre_down (
  String $cmd,
) {

  network::loopback_event { "inet_pre-down_${title}":
    event => 'pre-down',
    cmd   => $cmd,
  }

}

