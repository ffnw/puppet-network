define network::ipx::dynamic (
  String           $interface = $title,
  Optional[String] $frame     = undef,
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

  concat::fragment { "network_ipx_dynamic_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/ipx/dynamic.epp', {
      interface => $interface,
      frame     => $frame,
      pre_up    => $pre_up,
      up        => $up,
      post_up   => $post_up,
      pre_down  => $pre_down,
      down      => $down,
      post_down => $post_down,
    }),
    order   => '30',
  }

}
