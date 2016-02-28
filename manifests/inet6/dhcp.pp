define network::inet6::dhcp (
  String                 $interface = $title,
  Optional[String]       $hwaddress = undef,
  Optional[Integer[0,2]] $accept_ra = undef,
  Optional[Integer[0,1]] $autoconf  = undef,
  Array[String]          $pre_up    = [],
  Array[String]          $up        = [],
  Array[String]          $post_up   = [],
  Array[String]          $pre_down  = [],
  Array[String]          $down      = [],
  Array[String]          $post_down = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet6_dhcp_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/dhcp.epp', {
      interface => $interface,
      hwaddress => $hwaddress,
      accept_ra => $accept_ra,
      autoconf  => $autoconf,
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
