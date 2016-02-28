define network::loopback_event (
  Enum['pre-up','up','post-up','pre-down','down','post-down'] $event,
  Enum['inet','inet6']                                        $family,
  String                                                      $cmd,
) {

  if $family == 'inet' {
    $interface = $network::inet::loopback::interface
    $order = 30
  } elsif $family == 'inet6' {
    $interface = $network::inet6::loopback::interface
    $order = 50
  } else {
    fail('$family is not inet nor inet6');
  }
  
  $add = [ 'pre-up' => 1,
           'up' => 2,
           'post-up' => 3,
           'pre-down' => 4,
           'down' => 5,
           'post-down' => 6, ]
  $final_order = $order + $add[$event]

  concat::fragment { "network_loopback_${title}":
    target  => "${network::interfaces_d}/${interface}",
    content => "  ${event} ${cmd}",
    order   => $final_order,
  }
  
}

