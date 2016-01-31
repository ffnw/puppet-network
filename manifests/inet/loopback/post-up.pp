define network::inet::loopback::post_up (
  String $cmd,
) {

  network::loopback_event { "inet_post-up_${title}":
    event => 'post-up',
    cmd   => $cmd,
  }

}

