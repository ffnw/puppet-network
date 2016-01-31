define network::inet::ipv4ll (
  String        $interface,
  Array[String] $pre_up    = [],
  Array[String] $up        = [],
  Array[String] $post_up   = [],
  Array[String] $pre_down  = [],
  Array[String] $down      = [],
  Array[String] $post_down = [],
) {

  include network
  include network::params

  network::interface { "${interface}~default": }

  concat::fragment { "network_inet_ipv4ll_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/ipv4ll.epp'),
    order   => '20',
  }

}
