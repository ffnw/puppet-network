class network (
  String $interfaces_d = $network::params::interfaces_d,
) inherits network::params {

  class { 'network::install': }

  contain network::install

  create_resources('network::can::static',     hiera('network::can::static',     {}))

  create_resources('network::inet::bootp',     hiera('network::inet::bootp',     {}))
  create_resources('network::inet::dhcp',      hiera('network::inet::dhcp',      {}))
  create_resources('network::inet::ipv4ll',    hiera('network::inet::ipv4ll',    {}))
  create_resources('network::inet::manual',    hiera('network::inet::manual',    {}))
  create_resources('network::inet::ppp',       hiera('network::inet::ppp',       {}))
  create_resources('network::inet::static',    hiera('network::inet::static',    {}))
  create_resources('network::inet::tunnel',    hiera('network::inet::tunnel',    {}))
  create_resources('network::inet::wvdial',    hiera('network::inet::wvdial',    {}))

  create_resources('network::inet6::6to4',     hiera('network::inet6::6to4',     {}))
  create_resources('network::inet6::auto',     hiera('network::inet6::auto',     {}))
  create_resources('network::inet6::dhcp',     hiera('network::inet6::dhcp',     {}))
  create_resources('network::inet6::manual',   hiera('network::inet6::manual',   {}))
  create_resources('network::inet6::static',   hiera('network::inet6::static',   {}))
  create_resources('network::inet6::v4tunnel', hiera('network::inet6::v4tunnel', {}))

  create_resources('network::ipx::dynamic',    hiera('network::ipx::dynamic',    {}))
  create_resources('network::ipx::static',     hiera('network::ipx::static',     {}))

}
