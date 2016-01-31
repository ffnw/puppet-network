define network::inet6::loopback::post_down (
  String $cmd,
) {

  network::loopback_event { "inet6_post-down_${title}":
    event => 'post-down',
    cmd   => $cmd,
  }

}

