define network::inet::tunnel (
  String            $interface = $title,
  String            $address,
  String            $mode,
  String            $endpoint,
  Optional[String]  $dstaddr   = undef,
  Optional[String]  $local     = undef,
  Optional[String]  $gateway   = undef,
  Optional[Integer] $ttl       = undef,
  Optional[Integer] $mtu       = undef,
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

  concat::fragment { "network_inet_tunnel_${interface}_${address}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/tunnel.epp'),
    order   => '20',
  }

}
