define network::inet::dhcp (
  String            $interface  = $title,
  Optional[String]  $hostname   = undef,
  Optional[Integer] $metric     = undef,
  Optional[Integer] $leasehours = undef,
  Optional[Integer] $leasetime  = undef,
  Optional[String]  $vendor     = undef,
  Optional[String]  $client     = undef,
  Optional[String]  $hwaddress  = undef,
  Array[String]     $pre_up     = [],
  Array[String]     $up         = [],
  Array[String]     $post_up    = [],
  Array[String]     $pre_down   = [],
  Array[String]     $down       = [],
  Array[String]     $post_down  = [],
) {

  include network
  include network::params

  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet_dhcp_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/dhcp.epp'),
    order   => '20',
  }

}
