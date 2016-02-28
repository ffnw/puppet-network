define network::inet6::v4tunnel (
  String                   $interface          = $title,
  String                   $address,
  Optional[Integer[0,128]] $netmask            = undef,
  String                   $endpoint,
  Optional[String]         $local              = undef,
  Optional[String]         $gateway            = undef,
  Optional[Integer]        $ttl                = undef,
  Optional[Integer]        $mtu                = undef,
  Optional[Integer]        $preferred_lifetime = undef,
  Array[String]            $pre_up             = [],
  Array[String]            $up                 = [],
  Array[String]            $post_up            = [],
  Array[String]            $pre_down           = [],
  Array[String]            $down               = [],
  Array[String]            $post_down          = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet6_v4tunnel_${interface}_${address}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/v4tunnel.epp'),
    order   => '20',
  }

}
