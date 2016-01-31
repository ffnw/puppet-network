define network::inet6::loopback::post_up (
  String $cmd,
) {

  network::loopback_event { "inet6_post-up_${title}":
    event => 'post-up',
    cmd   => $cmd,
  }

}

