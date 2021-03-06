define network::can::static (
  String             $interface   = $title,
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
  
  if(!defined(Network::Interface["${interface}~default"])) {
    network::interface { "${interface}~default": }
  }

  concat::fragment { "network_can_static_${interface}_${bitrate}":
    target  => "${network::interfaces_d}/${interface}",
    content => epp('network/can/static.epp', {
      interface   => $interface,
      bitrate     => $bitrate,
      samplepoint => $samplepoint,
      loopback    => $loopback,
      listenonly  => $listenonly,
      triple      => $triple,
      oneshot     => $oneshot,
      berr        => $berr,
      pre_up      => $pre_up,
      up          => $up,
      post_up     => $post_up,
      pre_down    => $pre_down,
      down        => $down,
      post_down   => $post_down,
    }),
    order   => '50',
  }

}
