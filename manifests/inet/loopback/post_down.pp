define network::inet::loopback::post_down (
  String $cmd = $title,
) {

  include network::inet::loopback

  network::loopback_event { "inet_post-down_${title}":
    family => 'inet',
    event  => 'post-down',
    cmd    => $cmd,
  }

}

