# == Class snort::config
#
# This class is called from snort for service config.
#
class snort::config {
  file { '/etc/snort/snort.conf':
    ensure  => file,
    owner   => root,
    group   => root,
    content => template('snort/snort.conf.erb'),
    mode    => '0644',
  }
}
