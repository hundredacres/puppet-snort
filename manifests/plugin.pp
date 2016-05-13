define snort::plugin(
  $ensure          = 'present',
  $templatefile    = undef,
  $install_package = false,
  $has_service     = false,
  $notify_service  = true,
) {
  $manage_service_autorestart = $notify_service ? {
    true   => "Service[${name}]",
    false  => undef,
  }

  if $install_package {
    package{ $name:
      ensure  => present,
    }
  }

  if $has_service {
    service{ $name:
      ensure => running,
    }
  }

  if $templatefile {
    file{ "/etc/snort/${name}.conf":
      ensure  => file,
      owner   => root,
      group   => root,
      content => template($templatefile),
      require => Package[$::snort::package_name],
      notify  => $manage_service_autorestart,
    }
  }
}
