define network::inet::loopback::pre_up (
  String $cmd,
) {

  network::loopback_event { "inet_pre-up_${title}":
    event => 'pre-up',
    cmd   => $cmd,
  }

}

