define snort::plugin(
  $ensure          = 'present',
  $templatefile    = '',
  $install_package = false,
  $notify_service  = true,
) {
  $manage_service_autorestart = $notify_service ? {
    true   => "Service[${::snort::service_name}]",
    false  => undef,
  }

  if $install_package {
    package{ $name:
      ensure  => present,
      notify  => $manage_service_autorestart,
      require => Package[$::snort::package_name],
    }
  }
  if $templatefile {
    file{ "/etc/snort/${name}.conf":
      ensure  => file,
      owner   => root,
      group   => root,
      content => template($templatefile),
      notify  => $manage_service_autorestart,
      require => Package[$::snort::package_name],
    }
  }
}
