# == Class snort::install
#
# This class is called from snort for install.
#
class snort::install {
  package { $::snort::package_name:
    ensure => present,
  }
}
