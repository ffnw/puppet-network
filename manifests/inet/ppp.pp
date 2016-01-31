define network::inet::ppp (
  String            $interface = $title,
  Optional[String]  $provider  = undef,
  Optional[Integer] $unit      = undef,
  Optional[String]  $options   = undef,
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

  concat::fragment { "network_inet_ppp_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/ppp.epp'),
    order   => '20',
  }

}
