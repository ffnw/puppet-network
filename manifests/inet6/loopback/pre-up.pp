define network::inet6::loopback::pre_up (
  String $cmd,
) {

  network::loopback_event { "inet6_pre-up_${title}":
    event => 'pre-up',
    cmd   => $cmd,
  }

}

