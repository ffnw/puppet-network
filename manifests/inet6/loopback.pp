class network::inet6::loopback (
  String        $interface = 'lo',
  Array[String] $pre_up    = [],
  Array[String] $up        = [],
  Array[String] $post_up   = [],
  Array[String] $pre_down  = [],
  Array[String] $down      = [],
  Array[String] $post_down = [],
) inherits network {

  if(!defined(Network::Interface["${interface}~default"]) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_inet6_loopback":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet6/loopback.epp'),
    order   => '40',
  }

}

