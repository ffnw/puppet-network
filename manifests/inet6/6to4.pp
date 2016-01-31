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

  network::interface { "${interface}~default": }

  concat::fragment { "network_inet6_6to4_${interface}_${local}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/6to4.epp'),
    order   => '20',
  }

}
