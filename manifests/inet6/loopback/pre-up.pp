define network::inet6::loopback::pre_up (
  String $cmd,
) {

  require network::inet6::loopback

  network::loopback_event { "inet6_pre-up_${title}":
    event => 'pre-up',
    cmd   => $cmd,
  }

}

