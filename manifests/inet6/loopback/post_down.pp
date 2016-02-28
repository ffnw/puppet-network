define network::inet6::loopback::post_down (
  String $cmd,
) {

  require network::inet6::loopback

  network::loopback_event { "inet6_post-down_${title}":
    family => 'inet6',
    event  => 'post-down',
    cmd    => $cmd,
  }

}

