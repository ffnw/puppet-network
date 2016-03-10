define network::inet::loopback::pre_up (
  String $cmd = $title,
) {

  include network::inet::loopback

  network::loopback_event { "inet_pre-up_${title}":
    family => 'inet',
    event  => 'pre-up',
    cmd    => $cmd,
  }

}

