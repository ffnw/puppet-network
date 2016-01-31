define network::inet::loopback::post_down (
  String $cmd,
) {

  network::loopback_event { "inet_post-down_${title}":
    event => 'post-down',
    cmd   => $cmd,
  }

}

