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

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet_tunnel_${interface}_${address}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/tunnel.epp', {
      interface => $interface,
      address   => $address,
      mode      => $mode,
      endpoint  => $endpoint,
      dstaddr   => $dstaddr,
      local     => $local,
      gateway   => $gateway,
      ttl       => $ttl,
      mtu       => $mtu,
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
