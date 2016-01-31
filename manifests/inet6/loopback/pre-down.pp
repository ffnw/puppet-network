define network::inet6::loopback::pre_down (
  String $cmd,
) {

  network::loopback_event { "inet6_pre-down_${title}":
    event => 'pre-down',
    cmd   => $cmd,
  }

}

