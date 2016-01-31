define network::can::static (
  String             $interface,
  Integer[1,1000000] $bitrate,
  Numeric[0,0.999]   $samplepoint = undef,
  String             $loopback    = undef,
  String             $listenonly  = undef,
  String             $triple      = undef,
  String             $oneshot     = undef,
  String             $berr        = undef,
  Array[String]      $pre_up      = [],
  Array[String]      $up          = [],
  Array[String]      $post_up     = [],
  Array[String]      $pre_down    = [],
  Array[String]      $down        = [],
  Array[String]      $post_down   = [],
) {

  include network
  include network::params

  network::interface { "${interface}~default": }

  concat::fragment { "network_can_static_${interface}_${bitrate}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/can/static.epp'),
    order   => '20',
  }

}
