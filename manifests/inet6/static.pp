define network::inet6::static (
  String                   $interface          = $title,
  String                   $address,
  Optional[Integer[0,128]] $netmask            = undef,
  Optional[String]         $gateway            = undef,
  Optional[String]         $media              = undef,
  Optional[String]         $hwaddress          = undef,
  Optional[Integer]        $mtu                = undef,
  Optional[Integer[0,2]]   $accept_ra          = undef,
  Optional[Integer[0,1]]   $autoconf           = undef,
  Optional[Integer[0,2]]   $privext            = undef,
  Optional[String]         $scope              = undef,
  Optional[Integer]        $preferred_lifetime = undef,
  Optional[Integer]        $dad_attempts       = undef,
  Optional[Numeric]        $dad_interval       = undef,
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

  concat::fragment { "network_inet6_static_${interface}_${address}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/static.epp', {
      interface          => $interface,
      address            => $address,
      netmask            => $netmask,
      gateway            => $gateway,
      media              => $media,
      hwaddress          => $hwaddress,
      mtu                => $mtu,
      accept_ra          => $accept_ra,
      autoconf           => $autoconf,
      privext            => $privext,
      scope              => $scope,
      preferred_lifetime => $preferred_lifetime,
      dad_attempts       => $dad_attempts,
      dad_interval       => $dad_interval,
      pre_up             => $pre_up,
      up                 => $up,
      post_up            => $post_up,
      pre_down           => $pre_down,
      down               => $down,
      post_down          => $post_down,
    }),
    order   => '20',
  }

}
