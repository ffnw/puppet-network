define network::ipx::dynamic (
  String           $interface,
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

  network::interface { "${interface}~default": }

  concat::fragment { "network_ipx_dynamic_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/ipx/dynamic.epp'),
    order   => '20',
  }

}
