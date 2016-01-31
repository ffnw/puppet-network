define network::inet::manual (
  String        $interface,
  Array[String] $pre_up      = [],
  Array[String] $up          = [],
  Array[String] $post_up     = [],
  Array[String] $pre_down    = [],
  Array[String] $down        = [],
  Array[String] $post_down   = [],
) {

  include network
  include network::params

  network::interface { "${interface}~default": }

  concat::fragment { "network_inet_manual_${interface}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/inet/manual.epp'),
    order   => '20',
  }

}
