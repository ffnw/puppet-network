# puppet-network

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with network](#setup)
    * [What network affects](#what-network-affects)
    * [Beginning with network](#beginning-with-network)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manages network interfaces.

This module places one file per interface into a customizable directory (defaults to /etc/network/interfaces.d).

## Setup

### What network affects

This module affects the network configuration. You have to reconfigure your default network devices because /etc/network/interfaces will be overwritten.

### Beginning with network

```puppet
class { 'network': }
```

Do not forget to reconfigure the default interfaces.

## Usage

First initialize the module. The interfaces.d directory can be changed (not recommended).

```puppet
class { 'network':
  interfaces_d => '/etc/network/interfaces.d', # No trailing slash!
}
```

You can now initialize your interfaces. This step is optional and defaults to method 'auto'.
```puppet
network::interface { 'eth0':
  method => 'auto'
}
```

You can set iface options using several defines. Please refer to manpage interfaces(5). Please use the following pattern: 
```puppet
network::family::method { 'unique_name':
  option => value,
}
```

Example:
```puppet
network::inet::static { 'eth0-default-ip':
  interface => 'eth0', # Defaults to title
  address   => '192.168.1.1/24',
}
```

Loopback-Interfaces use classes instead of defines because there can only be one Loopback-Interface.
```puppet
class { 'network::inet::loopback':
  interface => 'lo',
}
```

Every iface definition takes optional arguments for interface events.
```puppet
network::inet::static { 'eth0':
  address   => '192.168.1.1/24',
  pre_up    => [ 'cmd1', 'cmd2' ],
  up        => [ 'cmd1', 'cmd2' ],
  post_up   => [ 'cmd1', 'cmd2' ],
  pre_down  => [ 'cmd1', 'cmd2' ],
  down      => [ 'cmd1', 'cmd2' ],
  post_down => [ 'cmd1', 'cmd2' ],
}

class { 'network::inet::loopback':
  interface => 'lo',
  pre_up    => [ 'cmd1', 'cmd2' ],
  up        => [ 'cmd1', 'cmd2' ],
  post_up   => [ 'cmd1', 'cmd2' ],
  pre_down  => [ 'cmd1', 'cmd2' ],
  down      => [ 'cmd1', 'cmd2' ],
  post_down => [ 'cmd1', 'cmd2' ],
}
```

## Reference

* class network
  * interfaces_d (optional, default '/etc/network/interfaces.d')

Please use the usage guide and man interfaces(5).

## Limitations

### OS compatibility
* Debian 8

## Development

### How to contribute
Fork the project, work on it and submit pull requests, please.

