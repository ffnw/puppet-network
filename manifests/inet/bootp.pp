define network::inet::bootp (
  String           $interface = $title,
  Optional[String] $bootfile  = undef,
  Optional[String] $server    = undef,
  Optional[String] $hwaddr    = undef,
  Array[String]    $pre_up    = [],
  Array[String]    $up        = [],
  Array[String]    $post_up   = [],
  Array[String]    $pre_down  = [],
  Array[String]    $down      = [],
  Array[String]    $post_down = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet_bootp_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/bootp.epp', {
      interface => $interface,
      bootfile  => $bootfile,
      server    => $server,
      hwaddr    => $hwaddr,
      pre_up    => $pre_up,
      up        => $up,
      post_up   => $post_up,
      pre_down  => $pre_down,
      down      => $down,
      post_down => $post_down,
    }),
    order   => '20',
  }

}
