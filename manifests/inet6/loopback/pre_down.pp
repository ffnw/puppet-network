define network::inet6::loopback::pre_down (
  String $cmd,
) {

  require network::inet6::loopback

  network::loopback_event { "inet6_pre-down_${title}":
    event => 'pre-down',
    cmd   => $cmd,
  }

}

