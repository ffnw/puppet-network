define network::inet6::loopback::pre_up (
  String $cmd = $title,
) {

  include network::inet6::loopback

  network::loopback_event { "inet6_pre-up_${title}":
    family => 'inet6',
    event  => 'pre-up',
    cmd    => $cmd,
  }

}

