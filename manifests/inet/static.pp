define network::inet::static (
  String            $interface   = $title,
  String            $address,
  Optional[String]  $netmask     = undef,
  Optional[String]  $broadcast   = undef,
  Optional[Integer] $metric      = undef,
  Optional[String]  $gateway     = undef,
  Optional[String]  $pointopoint = undef,
  Optional[String]  $hwaddress   = undef,
  Optional[Integer] $mtu         = undef,
  Optional[String]  $scope       = undef,
  Array[String]     $pre_up      = [],
  Array[String]     $up          = [],
  Array[String]     $post_up     = [],
  Array[String]     $pre_down    = [],
  Array[String]     $down        = [],
  Array[String]     $post_down   = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"]) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet_static_${interface}_${address}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/static.epp'),
    order   => '20',
  }

}
