define network::ipx::static (
  String            $interface = $title,
  Optional[String]  $frame     = undef,
  Optional[Integer] $netnum    = undef,
  Array[String]     $pre_up    = [],
  Array[String]     $up        = [],
  Array[String]     $post_up   = [],
  Array[String]     $pre_down  = [],
  Array[String]     $down      = [],
  Array[String]     $post_down = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_ipx_static_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/ipx/static.epp', {
      interface => $interface,
      frame     => $frame,
      netnum    => $netnum,
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
