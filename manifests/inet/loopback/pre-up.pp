define network::inet::loopback::pre_up (
  String $cmd,
) {

  require network::inet::loopback

  network::loopback_event { "inet_pre-up_${title}":
    event => 'pre-up',
    cmd   => $cmd,
  }

}

