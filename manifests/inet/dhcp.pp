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
    content => epp('network/inet/dhcp.epp', {
      interface  => $interface,
      hostname   => $hostname,
      metric     => $metric,
      leasehours => $leasehours,
      leasetime  => $leasetime,
      vendor     => $vendor,
      client     => $client,
      hwaddress  => $hwaddress,
      pre_up     => $pre_up,
      up         => $up,
      post_up    => $post_up,
      pre_down   => $pre_down,
      down       => $down,
      post_down  => $post_down,
    }),
    order   => '20',
  }

}
