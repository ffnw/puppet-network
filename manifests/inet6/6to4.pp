define network::inet6::6to4 (
  String            $interface          = $title,
  String            $local,
  Optional[Integer] $ttl                = undef,
  Optional[Integer] $mtu                = undef,
  Optional[Integer] $preferred_lifetime = undef,
  Array[String]     $pre_up             = [],
  Array[String]     $up                 = [],
  Array[String]     $post_up            = [],
  Array[String]     $pre_down           = [],
  Array[String]     $down               = [],
  Array[String]     $post_down          = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet6_6to4_${interface}_${local}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/6to4.epp', {
      interface          => $interface,
      local              => $local,
      ttl                => $ttl,
      mtu                => $mtu,
      preferred_lifetime => $preferred_lifetime,
      pre_up             => $pre_up,
      up                 => $up,
      post_up            => $post_up,
      pre_down           => $pre_down,
      down               => $down,
      post_down          => $post_down,
    }),
    order   => '40',
  }

}
