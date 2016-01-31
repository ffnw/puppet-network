class network (
  String $interfaces_d = $network::params::interfaces_d,
) inherits network::params {

  contain network::install
  
  class { 'network::install': }

}
