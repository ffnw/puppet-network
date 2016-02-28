define network::inet6::auto (
  String                 $interface = $title,
  Optional[Integer[0,2]] $privext   = undef,
  Optional[Integer[0,2]] $accept_ra = undef,
  Optional[Integer[0,1]] $dhcp      = undef,
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

  concat::fragment { "network_inet6_auto_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/auto.epp'),
    order   => '20',
  }

}
