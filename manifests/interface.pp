define network::interface (
  Enum['auto','allow-hotplug'] $method = 'auto',
) {

  include network
  include network::params

  $interface = $title.match('/^(\\w+)(?:~default)?$')[1]
  $target = "${network::interfaces_d}/${interface}"

  concat { $target:
    ensure         => 'present',
    ensure_newline => true,
    notify         => File['/etc/network/interfaces'],
  }

  if !defined(Concat::Fragment["network_${title}"]) {
    # Only create the fragment if there is no such fragment for the interface
    # Overwrite a default fragment when present
    if defined(Concat::Fragment["network_${interface}~default"]) {
      # Unset default if present
      Concat::Fragment <| title == "network_${interface}~default" |> {
        content => '',
        order   => '90',
      }
    }
    concat::fragment { "network_${title}":
      target  => $target,
      content => epp('network/interface.epp'),
      order   => '10',
    }
  } else {
    if $title == $interface {
      # Never send notices for defaults, because they are generated automatically
      # by this module. Just ignore them.
      notice("Concat::Fragment['network_${title}'] already defined!")
    }
  }
}
