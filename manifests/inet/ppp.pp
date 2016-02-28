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

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet_ppp_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/ppp.epp', {
      interface => $interface,
      provider  => $provider,
      unit      => $unit,
      options   => $options,
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
