define network::inet::loopback::pre_down (
  String $cmd,
) {

  require network::inet::loopback

  network::loopback_event { "inet_pre-down_${title}":
    event => 'pre-down',
    cmd   => $cmd,
  }

}

