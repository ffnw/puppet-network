define network::inet::loopback::post_up (
  String $cmd,
) {

  include network::inet::loopback

  network::loopback_event { "inet_post-up_${title}":
    family => 'inet',
    event  => 'post-up',
    cmd    => $cmd,
  }

}

