define network::inet6::loopback::post_up (
  String $cmd,
) {

  require network::inet6::loopback

  network::loopback_event { "inet6_post-up_${title}":
    event => 'post-up',
    cmd   => $cmd,
  }

}

