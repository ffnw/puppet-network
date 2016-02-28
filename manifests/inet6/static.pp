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
    content => epp('network/inet6/static.epp'),
    order   => '20',
  }

}
