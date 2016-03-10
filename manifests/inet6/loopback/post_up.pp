define network::inet6::loopback::post_up (
  String $cmd = $title,
) {

  include network::inet6::loopback

  network::loopback_event { "inet6_post-up_${title}":
    family => 'inet6',
    event  => 'post-up',
    cmd    => $cmd,
  }

}

