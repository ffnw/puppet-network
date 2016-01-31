define network::ipx::static (
  String            $interface,
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

  network::interface { "${interface}~default": }

  concat::fragment { "network_ipx_static_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/ipx/static.epp'),
    order   => '20',
  }

}
