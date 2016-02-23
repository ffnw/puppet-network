class network::install inherits network {

  service { 'networking':
    ensure => running
  }

  file {
    "${network::interfaces_d}/":
      ensure => directory,
      mode   => '0755',
      owner  => root,
      group  => root,
  } ->
  file {
    '/etc/network/interfaces':
      ensure  => file,
      mode    => '0644',
      content => epp('network/interfaces.epp'),
      notify  => Service['networking'],
  }

}
